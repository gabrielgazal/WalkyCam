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
    private var localUserId: String = ""

    // Expose the local connection id for local checks (read-only)
    var currentConnectionId: String {
        return localConnectionId
    }

    @Published var participants: [Participant] = []
    
    private init() {
        let serverURL = URL(string: "https://signalign.walkycam.com")!
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

                // IMPORTANT: Create a peer connection for this existing participant before trying to generate an offer.
                // Otherwise generateOffer will not find a peer connection and will return early.
                WebRTCManager.shared.createPeerConnection(for: participant)

                WebRTCManager.shared.generateOffer(for: participant.connectionId) { offer in
                    guard let offer = offer else { return }
                    
                    let data: [String: Any] = [
                        "connectionId": participant.connectionId,
                        "senderId": self.localUserId,
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
                            "senderId": self.localUserId,
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
            // This event can carry an SDP offer from a remote participant.
            // Instead of generating another offer here, set the remote offer and create an answer.
            guard let info = data.first as? [String: Any],
                  let connectionId = info["connectionId"] as? String else { return }

            // If there's an SDP offer from the remote, handle it and create an answer.
            if let sdpOffer = info["sdpOffer"] as? String {
                let sessionDescription = RTCSessionDescription(type: .offer, sdp: sdpOffer)

                // Ensure we have a Participant and a peer connection for this connectionId
                if self.participants.first(where: { $0.connectionId == connectionId }) == nil {
                    // If the participant isn't known yet, create a lightweight participant entry so we can attach the peerConnection.
                    let newParticipant = Participant(connectionId: connectionId, userId: "", userName: "Unknown")
                    DispatchQueue.main.async {
                        self.participants.append(newParticipant)
                    }
                    WebRTCManager.shared.createPeerConnection(for: newParticipant)
                } else {
                    if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                        if participant.peerConnection == nil {
                            WebRTCManager.shared.createPeerConnection(for: participant)
                        }
                    }
                }

                WebRTCManager.shared.handleRemoteOffer(sessionDescription, for: connectionId)
            } else {
                // No sdpOffer present: log or ignore.
                print("receiveVideoFrom received without sdpOffer for \(connectionId)")
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

        socket.on("receiveAudioStatus") { [weak self] data, ack in
            guard
                let self = self,
                let dict = data.first as? [String: Any],
                let connectionId = dict["connectionId"] as? String,
                let isEnabled = dict["isAudioEnabled"] as? Bool
            else {
                print("❌ Erro ao processar receiveAudioStatus")
                return
            }

            print("🔊 Audio status do usuário \(connectionId): \(isEnabled)")

            DispatchQueue.main.async {
                if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                    participant.isAudioEnabled = isEnabled
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
        localUserId = user.id

        // Start local video capture before joining so the local track is available when peerConnections are created.
        WebRTCManager.shared.startLocalVideo { _ in
            print("Local video started for user \(user.userName)")

            let data: [String: Any] = [
                "userName": user.userName,
                "userId": user.id,
                "videocallId": self.callId
            ]
            self.socket.emit("joinToVideocall", data)
        }
    }

    func receiveVideoAnswer(userId: String, sdpAnswer: String) {
        socket.emit("receiveVideoAnswer", [
            "connectionId": userId,
            "senderId": self.localUserId,
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
    
    func updateAudioStatus(isEnabled: Bool) {
        socket.emit("sendAudioStatus", [
            "connectionId": localConnectionId,
            "isAudioEnabled": isEnabled,
            "videocallId": callId
        ])
    }

    func sendIceCandidate(_ candidate: RTCIceCandidate, for connectionId: String) {
        let candidateData: [String: Any] = [
            "connectionId": connectionId,
            "sdpMid": candidate.sdpMid ?? "",
            // Caso o candidate.sdpMLineIndex seja Int32, convertemos para Int
            "sdpMLineIndex": Int(candidate.sdpMLineIndex),
            "sdp": candidate.sdp
        ]
        // Emit using the event name the server sends back to us (iceCandidate)
        socket.emit("iceCandidate", candidateData)
        print("📡 Candidato ICE emitido para \(connectionId): \(candidateData)")
    }
}
