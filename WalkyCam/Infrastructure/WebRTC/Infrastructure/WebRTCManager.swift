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
    private var peerDelegates: [String: RTCPeerConnectionDelegate] = [:]
    private var localCapturer: RTCCameraVideoCapturer?
    private var localVideoTrack: RTCVideoTrack?

    override init() {
        self.peerConnectionFactory = RTCPeerConnectionFactory()
        super.init()
    }
    
    func createPeerConnection(for participant: Participant) -> RTCPeerConnection {
        let config = RTCConfiguration()
        config.iceServers = [RTCIceServer(urlStrings: ["stun:stun.l.google.com:19302"])]
        
        let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        let delegate = PeerConnectionDelegate(participant: participant)
        peerDelegates[participant.connectionId] = delegate

        let connection = peerConnectionFactory.peerConnection(with: config, constraints: constraints, delegate: delegate)
        
        let videoTransceiverInit = RTCRtpTransceiverInit()
        videoTransceiverInit.direction = .recvOnly
        connection?.addTransceiver(of: .video, init: videoTransceiverInit)

        if let track = localVideoTrack {
            connection?.add(track, streamIds: ["stream0"])
        }

        peerConnections[participant.connectionId] = connection
        participant.peerConnection = connection
        return connection!
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
    func startLocalVideo(completion: @escaping (RTCVideoTrack?) -> Void) {
        let videoSource = peerConnectionFactory.videoSource()
        localCapturer = RTCCameraVideoCapturer(delegate: videoSource)

        // Escolher a câmera e resolução
        guard let frontCamera = (RTCCameraVideoCapturer.captureDevices().first { $0.position == .front }),
              let format = RTCCameraVideoCapturer.supportedFormats(for: frontCamera).first,
              let fps = format.videoSupportedFrameRateRanges.first?.maxFrameRate else {
            completion(nil)
            return
        }

        localCapturer?.startCapture(with: frontCamera, format: format, fps: Int(fps))

        localVideoTrack = peerConnectionFactory.videoTrack(with: videoSource, trackId: "localVideo")
        completion(localVideoTrack)
    }

}

class PeerConnectionDelegate: NSObject, RTCPeerConnectionDelegate {
    
    let participant: Participant

    init(participant: Participant) {
        self.participant = participant
    }

    func peerConnection(_ peerConnection: RTCPeerConnection, didAdd stream: RTCMediaStream) {
        // Compatibilidade com streams legados, opcional
    }

    func peerConnection(_ peerConnection: RTCPeerConnection, didAdd receiver: RTCRtpReceiver, streams: [RTCMediaStream]) {
        if let track = receiver.track as? RTCVideoTrack {
            DispatchQueue.main.async {
                print("🎥 Track recebida para \(self.participant.userName)")
                self.participant.videoTrack = track

                // ⚠️ Força a lista de participantes a ser atualizada no ObservableObject
                if let index = SocketManagerService.shared.participants.firstIndex(where: { $0.connectionId == self.participant.connectionId }) {
                    // Aqui apenas reatribuímos o array pra forçar notificação
                    var updated = SocketManagerService.shared.participants
                    updated[index] = self.participant
                    SocketManagerService.shared.participants = updated
                }
            }
        }
    }


    // Os outros métodos podem ficar vazios por enquanto:
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        // TODO: Emitir via WebSocket se necessário
    }
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {}
    func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {}
}
