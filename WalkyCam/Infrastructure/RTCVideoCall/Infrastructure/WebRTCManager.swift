//
//  WebRTCManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/04/25.
//

import Foundation
import WebRTC

class WebRTCManager: NSObject {
    static let shared = WebRTCManager()

    private var peerConnections: [String: RTCPeerConnection] = [:]
    private var videoTracks: [String: RTCVideoTrack] = [:]

    private let factory: RTCPeerConnectionFactory
    private var localVideoSource: RTCVideoSource?
    private var localCapturer: RTCCameraVideoCapturer?

    var localVideoTrack: RTCVideoTrack?
    var localAudioTrack: RTCAudioTrack?

    private override init() {
        RTCInitializeSSL()
        self.factory = RTCPeerConnectionFactory()
        super.init()
        setupLocalMedia()
    }

    func setupLocalMedia() {
        let audioTrack = factory.audioTrack(withTrackId: "localAudio")
        self.localAudioTrack = audioTrack

        let videoSource = factory.videoSource()
        self.localVideoSource = videoSource

        let videoTrack = factory.videoTrack(with: videoSource, trackId: "localVideo")
        self.localVideoTrack = videoTrack

        let capturer = RTCCameraVideoCapturer(delegate: videoSource)
        self.localCapturer = capturer

        startCapture()
    }

    private func startCapture() {
        guard let capturer = localCapturer else { return }
        guard let device = RTCCameraVideoCapturer.captureDevices().first,
              let format = device.formats.first,
              let fps = format.videoSupportedFrameRateRanges.first?.maxFrameRate else { return }

        capturer.startCapture(with: device, format: format, fps: Int(fps))
    }

    func createPeerConnection(for participant: Participant) {
        let config = RTCConfiguration()
        config.iceServers = [
            RTCIceServer(urlStrings: ["stun:stun.l.google.com:19302"])
        ]
        config.sdpSemantics = .unifiedPlan

        let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        let connection = factory.peerConnection(with: config, constraints: constraints, delegate: self)

        if let videoTrack = localVideoTrack {
            _ = connection?.add(videoTrack, streamIds: ["stream0"])
        }
        if let audioTrack = localAudioTrack {
            _ = connection?.add(audioTrack, streamIds: ["stream0"])
        }

        peerConnections[participant.connectionId] = connection
    }

    func generateOffer(for connectionId: String, completion: @escaping (RTCSessionDescription?) -> Void) {
        guard let connection = peerConnections[connectionId] else {
            completion(nil)
            return
        }

        let constraints = RTCMediaConstraints(
            mandatoryConstraints: [
                "OfferToReceiveAudio": "true",
                "OfferToReceiveVideo": "true"
            ],
            optionalConstraints: nil
        )

        connection.offer(for: constraints) { offer, error in
            guard let offer = offer else {
                print("❌ Erro ao gerar oferta: \(error?.localizedDescription ?? "Desconhecido")")
                completion(nil)
                return
            }
            
            print("✅ Oferta SDP gerada com sucesso")
            connection.setLocalDescription(offer) { error in
                if let error = error {
                    print("❌ Erro ao definir descrição local: \(error.localizedDescription)")
                } else {
                    print("✅ Descrição local definida com sucesso")
                }
            }
            
            completion(offer)
        }
    }

    func handleAnswer(_ sdp: RTCSessionDescription, for connectionId: String) {
        guard let connection = peerConnections[connectionId] else { return }
        connection.setRemoteDescription(sdp) { error in
            print("Algum erro deu! \(error?.localizedDescription)")
        }
    }

    func handleIceCandidate(_ candidate: RTCIceCandidate, for participant: Participant) {
        guard let connection = peerConnections[participant.connectionId] else { return }
        connection.add(candidate)
    }

    func setRemoteTrack(for connectionId: String, track: RTCVideoTrack) {
        print("🎥 Configurando track remoto para \(connectionId)")
        videoTracks[connectionId] = track
    }

    func getRemoteTrack(for connectionId: String) -> RTCVideoTrack? {
        let track = videoTracks[connectionId]
        print("🔍 Obtendo track para \(connectionId): \(track != nil ? "encontrado" : "não encontrado")")
        return track
    }

    func removePeerConnection(for connectionId: String) {
        peerConnections[connectionId]?.close()
        peerConnections.removeValue(forKey: connectionId)
        videoTracks.removeValue(forKey: connectionId)
    }
    
    func setVideoEnabled(_ isEnabled: Bool) {
        localVideoTrack?.isEnabled = isEnabled
        SocketManagerService.shared.updateVideoStatus(isEnabled: isEnabled)
    }
}

extension WebRTCManager: RTCPeerConnectionDelegate {
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        guard let connectionId = peerConnections.first(where: { $0.value == peerConnection })?.key else { return }
        SocketManagerService.shared.sendIceCandidate(candidate, for: connectionId)
    }

    func peerConnection(_ peerConnection: RTCPeerConnection, didAdd stream: RTCMediaStream) {
        if let track = stream.videoTracks.first,
           let connectionId = peerConnections.first(where: { $0.value == peerConnection })?.key {
            DispatchQueue.main.async {
                print("🎬 Track de vídeo remoto recebido para \(connectionId)")
                self.setRemoteTrack(for: connectionId, track: track)
                NotificationCenter.default.post(name: Notification.Name("RemoteTrackReceived"), object: nil)
            }
        }
    }

    func peerConnectionShouldNegotiate(_ peerConnection: RTCPeerConnection) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didChange stateChanged: RTCSignalingState) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove stream: RTCMediaStream) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceConnectionState) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didChange newState: RTCIceGatheringState) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didRemove candidates: [RTCIceCandidate]) {}

    func peerConnection(_ peerConnection: RTCPeerConnection, didOpen dataChannel: RTCDataChannel) {}
}

extension WebRTCManager: RTCVideoCapturerDelegate {
    func capturer(_ capturer: RTCVideoCapturer, didCapture frame: RTCVideoFrame) {
        print("📸 Frame capturado")
    }
}
