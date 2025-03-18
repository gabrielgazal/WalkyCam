//
//  WebRTCManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import WebRTC

class WebRTCManager: NSObject, ObservableObject {
    static let shared = WebRTCManager()
    
    private var peerConnectionFactory: RTCPeerConnectionFactory
    private var peerConnections: [String: RTCPeerConnection] = [:]
    
    override init() {
        self.peerConnectionFactory = RTCPeerConnectionFactory()
        super.init()
    }
    
    func createPeerConnection(for participant: Participant) -> RTCPeerConnection {
        let config = RTCConfiguration()
        config.iceServers = [RTCIceServer(urlStrings: ["stun:stun.l.google.com:19302"])]
        
        let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        let connection = peerConnectionFactory.peerConnection(with: config, constraints: constraints, delegate: nil)
        
        // Adiciona a captura local de vídeo e áudio ao PeerConnection
        if let videoTrack = MediaManager.shared.localVideoTrack {
            let stream = peerConnectionFactory.mediaStream(withStreamId: "stream0")
            stream.addVideoTrack(videoTrack)
            connection.add(stream)
        }
        
        if let audioTrack = MediaManager.shared.localAudioTrack {
            let stream = peerConnectionFactory.mediaStream(withStreamId: "stream0")
            stream.addAudioTrack(audioTrack)
            connection.add(stream)
        }
        
        peerConnections[participant.connectionId] = connection
        participant.peerConnection = connection
        return connection
    }
    
    func generateOffer(for userId: String, completion: @escaping (RTCSessionDescription?) -> Void) {
        guard let peerConnection = peerConnections[userId] else { return }
        
        peerConnection.offer(for: RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)) { offer, error in
            guard let offer = offer else { return }
            peerConnection.setLocalDescription(offer) { _ in
                completion(offer)
            }
        } 
    }
    
    func handleRemoteOffer(_ offer: RTCSessionDescription, for userId: String) {
        guard let peerConnection = peerConnections[userId] else { return }
        peerConnection.setRemoteDescription(offer, completionHandler: { _ in })
    }
    
    func handleAnswer(_ answer: RTCSessionDescription, for userId: String) {
        guard let peerConnection = peerConnections[userId] else { return }
        peerConnection.setRemoteDescription(answer, completionHandler: { _ in })
    }
    
    func handleIceCandidate(_ candidate: RTCIceCandidate, for participant: Participant) {
        guard let peerConnection = participant.peerConnection else { return }
        peerConnection.add(candidate)
    }
}
