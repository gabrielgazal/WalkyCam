//
//  SocketManagerService.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/04/25.
//

import Foundation
import SocketIO
import WebRTC

class SocketManagerService: NSObject, ObservableObject {
    static let shared = SocketManagerService()

    private let manager: SocketManager
    private let socket: SocketIOClient
    private var callId: String = ""
    @Published var localConnectionId: String = ""
    private var localUserId: String = ""

    @Published var participants: [Participant] = []

    private override init() {
        let serverURL = URL(string: "https://signalign.walkycam.com:2096")!
        manager = SocketManager(socketURL: serverURL, config: [.log(true), .compress, .forceWebsockets(true)])
        socket = manager.defaultSocket

        super.init()
        setupSocketEvents()
    }

    func updateVideocallId(videocallId: String) {
        callId = videocallId
    }

    func connect() {
        socket.connect()
    }

    func disconnect() {
        socket.disconnect()
        participants.removeAll()
        callId = ""
    }

    fileprivate func renegotiateConnection() {
        for participant in self.participants {
            // Força a adição dos tracks novamente
            WebRTCManager.shared.ensureLocalTracksAreAdded()
            
            // Gera uma nova oferta
            WebRTCManager.shared.generateOffer(for: participant.connectionId) { offer in
                guard let offer = offer else { return }
                
                let offerPayload: [String: Any] = [
                    "connectionId": participant.connectionId,
                    "senderId": self.localUserId,
                    "sdpOffer": offer.sdp
                ]
                
                print("📡 Emitindo receiveVideoFrom para \(participant.connectionId) (renegociação)")
                self.socket.emit("receiveVideoFrom", offerPayload)
            }
        }
    }
    
    func joinVideoCall() {
        guard let user = try? UserSession().user() else {
            print("❌ Não foi possível obter o usuário para entrar na videochamada")
            return
        }
        
        localUserId = user.id
        
        let data: [String: Any] = [
            "userName": user.userName,
            "userId": user.id,
            "videocallId": callId,
            "isVideoEnabled": WebRTCManager.shared.localVideoTrack?.isEnabled ?? true,
            "idHostUser": "6695d6a939b668e8a20be643"
        ]
        
        print("📣 Entrando na videochamada com ID: \(callId), como: \(user.userName)")
        socket.emit("joinToVideocall", data)
        
        // Teste forçando renegociação após alguns segundos
        print("🔄 Forçando renegociação de todas as conexões")
        renegotiateConnection()
        
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

                let isVideoEnabled = user["isVideoEnabled"] as? Bool ?? true

                let participant = Participant(
                    connectionId: connectionId,
                    userId: userId,
                    userName: userName
                )

                self.participants.append(participant)
                WebRTCManager.shared.createPeerConnection(for: participant)

                WebRTCManager.shared.generateOffer(for: participant.connectionId) { offer in
                    guard let offer = offer else { return }
                    let offerPayload: [String: Any] = [
                        "connectionId": participant.connectionId,
                        "senderId": self.localUserId,
                        "sdpOffer": offer.sdp
                    ]
                    print("📡 Emitindo receiveVideoFrom para \(participant.connectionId)")
                    self.socket.emit("receiveVideoFrom", offerPayload)
                }

            }
        }

        // Evento que atualiza status do vídeo dos participantes
        socket.on("receiveVideoStatus") { [weak self] data, _ in
            guard
                let self = self,
                let dict = data.first as? [String: Any],
                let connectionId = dict["connectionId"] as? String,
                let isEnabled = dict["isVideoEnabled"] as? Bool
            else {
                print("❌ Erro ao processar receiveVideoStatus")
                return
            }

            print("📺 Vídeo de \(connectionId) está agora \(isEnabled ? "ativado" : "desativado")")

            DispatchQueue.main.async {
                if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                    participant.isVideoEnabled = isEnabled
                }
            }
        }
        
        socket.on("receiveVideoAnswer") { data, _ in
            guard let info = data.first as? [String: Any],
                  let connectionId = info["connectionId"] as? String,
                  let sdpAnswer = info["sdpAnswer"] as? String else { return }
            
            let answerDescription = RTCSessionDescription(type: .answer, sdp: sdpAnswer)
            WebRTCManager.shared.handleAnswer(answerDescription, for: connectionId)
        }

        socket.on("iceCandidate") { data, _ in
            guard let info = data.first as? [String: Any],
                  let connectionId = info["connectionId"] as? String,
                  let sdp = info["sdp"] as? String,
                  let sdpMid = info["sdpMid"] as? String,
                  let sdpMLineIndex = info["sdpMLineIndex"] as? Int32 else { return }
            
            let candidate = RTCIceCandidate(sdp: sdp, sdpMLineIndex: sdpMLineIndex, sdpMid: sdpMid)
            
            if let participant = self.participants.first(where: { $0.connectionId == connectionId }) {
                WebRTCManager.shared.handleIceCandidate(candidate, for: participant)
            }
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

    func sendIceCandidate(_ candidate: RTCIceCandidate, for connectionId: String) {
        let candidateData: [String: Any] = [
            "connectionId": connectionId,
            "sdpMid": candidate.sdpMid ?? "",
            "sdpMLineIndex": Int(candidate.sdpMLineIndex),
            "sdp": candidate.sdp
        ]
        socket.emit("onIceCandidate", candidateData)
        print("📡 Candidato ICE emitido para \(connectionId): \(candidateData)")
    }
}
