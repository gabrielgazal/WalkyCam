//
//  WebSocketManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import SocketIO
import WebRTC

class SocketManagerService: ObservableObject {
    static let shared = SocketManagerService()
    
    private let manager: SocketManager
    private let socket: SocketIOClient
    private var callId: String = ""
    private var localConnectionId: String = ""
    
    @Published var participants: [Participant] = []
    
    private init() {
        let serverURL = URL(string: "https://signalign.walkycam.com:2096")!
        manager = SocketManager(socketURL: serverURL, config: [.log(true), .compress, .forceWebsockets(true)])
        socket = manager.defaultSocket
        
        setupSocketEvents()
    }
    
    func updateVideocallId(videocallId: String) {
        callId = videocallId
    }
    
    func setupSocketEvents() {
        socket.on(clientEvent: .connect) { data, _ in
            print("Conectado ao servidor WebSocket!")
            self.localConnectionId = self.socket.sid ?? ""
            print("ConnectionID Local: \(self.localConnectionId)")
            self.joinVideoCall()
        }
        
        socket.on("existingParticipants") { data, _ in
            guard let info = data.first as? [String: Any],
                  let existing = info["existingParticipants"] as? [[String: Any]] else { return }
            
            for user in existing {
                guard let connectionId = user["connectionId"] as? String,
                      let userId = user["userId"] as? String,
                      let userName = user["userName"] as? String else { continue }
                
                let participant = Participant(
                    connectionId: connectionId,
                    userId: userId,
                    userName: userName
                )
                
                self.participants.append(participant)

                WebRTCManager.shared.generateOffer(for: participant.connectionId) { offer in
                    guard let offer = offer else { return }
                    
                    let data: [String: Any] = [
                        "connectionId": participant.connectionId,
                        "sdpOffer": offer.sdp
                    ]
                    
                    self.socket.emit("receiveVideoFrom", data)
                }
            }
        }
        
        
        socket.on("newParticipantArrived") { data, _ in
            if let info = data.first as? [String: Any] {
                let participant = Participant(
                    connectionId: info["connectionId"] as! String,
                    userId: info["userId"] as! String,
                    userName: info["userName"] as! String,
                    isHandRaised: info["isHandRaised"] as! Bool
                )
                DispatchQueue.main.async {
                    self.participants.append(participant)
                    WebRTCManager.shared.createPeerConnection(for: participant)
                    WebRTCManager.shared.generateOffer(for: participant.connectionId) { offer in
                        guard let offer = offer else { return }
                        let data: [String: Any] = [
                            "connectionId": participant.connectionId,
                            "sdpOffer": offer.sdp
                        ]
                        self.socket.emit("receiveVideoFrom", data)
                    }
                }
            }
        }
        
        socket.on("iceCandidate") { data, _ in
            if let info = data.first as? [String: Any] {
                let connectionId = info["connectionId"] as! String
                let sdpMid = info["sdpMid"] as! String
                let sdpMLineIndex = info["sdpMLineIndex"] as! Int
                let sdp = info["sdp"] as! String
                if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                    let candidate = RTCIceCandidate(sdp: sdp, sdpMLineIndex: Int32(sdpMLineIndex), sdpMid: sdpMid)
                    WebRTCManager.shared.handleIceCandidate(candidate, for: participant)
                }
            }
        }
        
        socket.on("participantLeft") { data, _ in
            if let info = data.first as? [String: Any], let connectionId = info["connectionId"] as? String {
                DispatchQueue.main.async {
                    self.participants.removeAll { $0.connectionId == connectionId }
                }
            }
        }
        
        socket.on("receiveVideoAnswer") { data, _ in
            guard let info = data.first as? [String: Any],
                  let connectionId = info["connectionId"] as? String,
                  let sdpAnswer = info["sdpAnswer"] as? String else { return }
            
            let sessionDescription = RTCSessionDescription(type: .answer, sdp: sdpAnswer)
            WebRTCManager.shared.handleAnswer(sessionDescription, for: connectionId)
        }
        
        socket.on("receiveVideoFrom") { data, _ in
            guard let info = data.first as? [String: Any],
                  let connectionId = info["connectionId"] as? String else { return }
            guard let participant = self.participants.first(where: { $0.connectionId == connectionId }) else {
                print("❌ Participante \(connectionId) não encontrado para receiveVideoFrom")
                return
            }
            WebRTCManager.shared.generateOffer(for: connectionId) { offer in
                guard let offer = offer else {
                    print("❌ Falha ao gerar offer para \(connectionId)")
                    return
                }
                let data: [String: Any] = [
                    "connectionId": connectionId,
                    "sdpOffer": offer.sdp
                ]
                self.socket.emit("receiveVideoFrom", data)
            }
        }
        
        socket.on("receiveVideoStatus") { [weak self] data, ack in
            guard
                let self = self,
                let dict = data.first as? [String: Any],
                let connectionId = dict["connectionId"] as? String,
                let isEnabled = dict["isVideoEnabled"] as? Bool
            else {
                print("❌ Erro ao processar receiveVideoStatus")
                return
            }

            print("📺 Video status do usuário \(connectionId): \(isEnabled)")

            DispatchQueue.main.async {
                if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                    participant.isVideoEnabled = isEnabled
                } else {
                    print("⚠️ Participante com id \(connectionId) não encontrado")
                }
            }
        }

    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
        participants.removeAll()
        callId = ""
    }
    
    func joinVideoCall() {
        guard let user = try? UserSession().user() else { return }
        
        let data: [String: Any] = [
            "userName": user.userName,
            "userId": user.id,
            "videocallId": callId
        ]
        socket.emit("joinToVideocall", data)
    }
    
    func receiveVideoAnswer(userId: String, sdpAnswer: String) {
        socket.emit("receiveVideoAnswer", [
            "connectionId": userId,
            "sdpAnswer": sdpAnswer
        ])
    }
    
    func updateVideoStatus(isEnabled: Bool) {
        socket.emit("sendVideoStatus", [
            "connectionId": localConnectionId,
            "isVideoEnabled": isEnabled,
            "videocallId": callId
        ])
    }
}
