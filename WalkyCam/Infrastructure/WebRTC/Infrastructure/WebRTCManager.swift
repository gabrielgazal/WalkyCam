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
        
        // Configurar o video depois de acabar a configuracao do iceCandidate
        let videoTransceiverInit = RTCRtpTransceiverInit()
        videoTransceiverInit.direction = .sendRecv
        connection?.addTransceiver(of: .video, init: videoTransceiverInit)

        if let track = localVideoTrack {
            print("✅ Adicionando localVideoTrack ao peerConnection de \(participant.userName): \(track.trackId)")
            // Verificar qual stream do localStreams tem algo e enviar esse id
//            for connection in connection?.localStreams {
//                
//            }
            track.isEnabled = true
            connection?.add(track, streamIds: ["stream0"])
        } else {
            print("❌ localVideoTrack ainda é nil ao criar peerConnection de \(participant.userName)")
        }

        peerConnections[participant.connectionId] = connection
        participant.peerConnection = connection
        return connection!
    }

    
    func generateOffer(for userId: String, completion: @escaping (RTCSessionDescription?) -> Void) {
        guard let peerConnection = peerConnections[userId] else { return }
        
        peerConnection.offer(for: RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)) { offer, error in
            guard let offer = offer else {
                print("❌ Falha ao gerar offer: \(error?.localizedDescription ?? "erro desconhecido")")
                return
            }
            print("📡 Offer gerada para \(userId):\n\(offer.sdp)")
            peerConnection.setLocalDescription(offer) { _ in
                completion(offer)
            }
        }
    }

    func handleRemoteOffer(_ offer: RTCSessionDescription, for userId: String) {
        guard let peerConnection = peerConnections[userId] else { return }
        
        peerConnection.setRemoteDescription(offer) { [weak self] error in
            guard error == nil else {
                print("❌ Erro ao setar remote description: \(error!.localizedDescription)")
                return
            }
            
            let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
            peerConnection.answer(for: constraints) {
                answer,
                error in
                guard let answer = answer else {
                    print("❌ Erro ao criar answer: \(error?.localizedDescription ?? "desconhecido")")
                    return
                }
                
                peerConnection.setLocalDescription(answer) { _ in }
                
                SocketManagerService.shared.receiveVideoAnswer(
                    userId: userId,
                    sdpAnswer: answer.sdp
                )
            }
        }
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

                if let renderer = self.participant.renderer {
                    track.add(renderer)
                } else {
                    print("⚠️ Renderer ainda não setado para \(self.participant.userName)")
                }

                // Forçar atualização do @Published
                if let index = SocketManagerService.shared.participants.firstIndex(where: { $0.connectionId == self.participant.connectionId }) {
                    var updated = SocketManagerService.shared.participants
                    updated[index] = self.participant
                    SocketManagerService.shared.participants = updated
                }
            }
        }

    }


    // Os outros métodos podem ficar vazios por enquanto:
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {}
    // Em WebRTCManager.swift (classe PeerConnectionDelegate)
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        // Emite o candidato ICE para o servidor
        SocketManagerService.shared.sendIceCandidate(candidate, for: participant.connectionId)
    }

    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {}
    func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {}
    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {}
}
