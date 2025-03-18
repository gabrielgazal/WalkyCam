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
            self.joinVideoCall()
        }
        
        socket.on("existingParticipants") { data, _ in
            if let info = data.first as? [String: Any], let users = info["existingParticipants"] as? [[String: Any]] {
                DispatchQueue.main.async {
                    for user in users {
                        let participant = Participant(
                            connectionId: user["connectionId"] as! String,
                            userId: user["userId"] as! String,
                            userName: user["userName"] as! String
                        )
                        self.participants.append(participant)
                        WebRTCManager.shared.createPeerConnection(for: participant)
                    }
                }
            }
        }
        
        socket.on("newParticipantArrived") { data, _ in
            if let info = data.first as? [String: Any] {
                let participant = Participant(
                    connectionId: info["connectionId"] as! String,
                    userId: info["userId"] as! String,
                    userName: info["userName"] as! String
                )
                DispatchQueue.main.async {
                    self.participants.append(participant)
                    WebRTCManager.shared.createPeerConnection(for: participant)
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
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
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
}
