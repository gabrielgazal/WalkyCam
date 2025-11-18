//
//  WebRTCManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import WebRTC
import AVFoundation

class WebRTCManager: NSObject, ObservableObject {
    static let shared = WebRTCManager()
    
    private var peerConnectionFactory: RTCPeerConnectionFactory
    private var peerConnections: [String: RTCPeerConnection] = [:]
    private var peerDelegates: [String: RTCPeerConnectionDelegate] = [:]
    private var localCapturer: RTCCameraVideoCapturer?
    private var localVideoTrack: RTCVideoTrack?
    private var localAudioTrack: RTCAudioTrack?

    override init() {
        // Initialize peer connection factory
        RTCInitializeSSL()
        
        // Configure audio session for WebRTC with optimal settings for volume
        let audioSession = RTCAudioSession.sharedInstance()
        audioSession.lockForConfiguration()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, with: .defaultToSpeaker)
            try audioSession.setMode(AVAudioSession.Mode.videoChat)
            // Override to force speaker output
            try audioSession.setActive(true)
        } catch {
            print("❌ Error configuring audio session: \(error.localizedDescription)")
        }
        audioSession.unlockForConfiguration()
        
        // Configure WebRTC audio processing for better volume
        RTCAudioSession.sharedInstance().useManualAudio = false
        RTCAudioSession.sharedInstance().isAudioEnabled = true
        
        self.peerConnectionFactory = RTCPeerConnectionFactory()
        super.init()
    }
    
    @discardableResult
    func createPeerConnection(for participant: Participant) -> RTCPeerConnection {
        let config = RTCConfiguration()
        config.iceServers = [RTCIceServer(urlStrings: ["stun:stun.l.google.com:19302"])]
        
        let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        let delegate = PeerConnectionDelegate(participant: participant)
        peerDelegates[participant.connectionId] = delegate

        guard let connection = peerConnectionFactory.peerConnection(with: config, constraints: constraints, delegate: delegate) else {
            fatalError("❌ Não foi possível criar RTCPeerConnection")
        }

        print("🔧 Criando peerConnection para: \(participant.userName) (\(participant.connectionId))")

        // Configurar o video transceiver para enviar/receber
        let videoTransceiverInit = RTCRtpTransceiverInit()
        videoTransceiverInit.direction = .sendRecv
        let _ = connection.addTransceiver(of: .video, init: videoTransceiverInit)
        print("🔁 Video transceiver configurado para \(participant.userName)")

        // Configurar o audio transceiver para enviar/receber
        let audioTransceiverInit = RTCRtpTransceiverInit()
        audioTransceiverInit.direction = .sendRecv
        let _ = connection.addTransceiver(of: .audio, init: audioTransceiverInit)
        print("🔁 Audio transceiver configurado para \(participant.userName)")

        // Anexa a local video track ao peerConnection se já existir
        if let track = localVideoTrack {
            print("✅ Adicionando localVideoTrack ao peerConnection de \(participant.userName): \(track.trackId)")
            track.isEnabled = true
            connection.add(track, streamIds: ["stream0"])
        } else {
            print("❌ localVideoTrack ainda é nil ao criar peerConnection de \(participant.userName)")
        }

        // Anexa a local audio track ao peerConnection se já existir
        if let audio = localAudioTrack {
            print("✅ Adicionando localAudioTrack ao peerConnection de \(participant.userName): \(audio.trackId)")
            audio.isEnabled = true
            connection.add(audio, streamIds: ["stream0"])
        } else {
            print("⚠️ localAudioTrack ainda é nil ao criar peerConnection de \(participant.userName)")
        }

        peerConnections[participant.connectionId] = connection
        participant.peerConnection = connection
        return connection
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
        
        peerConnection.setRemoteDescription(offer) { error in
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
        // Use the completionHandler-based API (non-deprecated)
        peerConnection.add(candidate) { error in
            if let error = error {
                print("❌ Falha ao adicionar ICE candidate: \(error.localizedDescription)")
            } else {
                print("✅ ICE candidate adicionado para \(participant.connectionId)")
            }
        }
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
        localVideoTrack?.isEnabled = true

        // Request microphone permission before creating audio track
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
            guard let self = self else { return }
            
            if granted {
                // Também criamos uma audio track para enviar áudio junto com o vídeo
                let audioConstraints = RTCMediaConstraints(mandatoryConstraints: [
                    "googEchoCancellation": "true",
                    "googAutoGainControl": "true",
                    "googNoiseSuppression": "true",
                    "googHighpassFilter": "true"
                ], optionalConstraints: nil)
                let audioSource = self.peerConnectionFactory.audioSource(with: audioConstraints)
                self.localAudioTrack = self.peerConnectionFactory.audioTrack(with: audioSource, trackId: "localAudio")
                self.localAudioTrack?.isEnabled = true
                
                print("🎬 Local audio track created: \(self.localAudioTrack?.trackId ?? "nil")")
                
                // Add audio track to existing peer connections
                DispatchQueue.main.async {
                    for (connectionId, connection) in self.peerConnections {
                        if let localAudio = self.localAudioTrack {
                            if connection.senders.first(where: { $0.track?.trackId == localAudio.trackId }) == nil {
                                print("🔗 Anexando localAudioTrack ao peerConnection de \(connectionId)")
                                connection.add(localAudio, streamIds: ["stream0"])
                            }
                        }
                    }
                }
            } else {
                print("⚠️ Permissão de microfone negada pelo usuário")
            }
        }

        print("🎬 Local video track created: \(localVideoTrack?.trackId ?? "nil")")

        // Attach newly created local tracks to any existing peer connections that were created earlier
        DispatchQueue.main.async {
            guard let localVideo = self.localVideoTrack else {
                print("⚠️ startLocalVideo: localVideoTrack unexpectedly nil when attaching to existing peer connections")
                completion(self.localVideoTrack)
                return
            }

            for (connectionId, connection) in self.peerConnections {
                // Video
                if connection.senders.first(where: { $0.track?.trackId == localVideo.trackId }) == nil {
                    print("🔗 Anexando localVideoTrack ao peerConnection de \(connectionId)")
                    connection.add(localVideo, streamIds: ["stream0"])
                } else {
                    print("ℹ️ localVideoTrack já anexada ao peerConnection de \(connectionId)")
                }
            }

            completion(self.localVideoTrack)
        }
    }
    
    func toggleAudio(enabled: Bool) {
        localAudioTrack?.isEnabled = enabled
        print("🔊 Audio \(enabled ? "habilitado" : "desabilitado")")
    }
    
    func toggleVideo(enabled: Bool) {
        localVideoTrack?.isEnabled = enabled
        print("🎥 Video \(enabled ? "habilitado" : "desabilitado")")
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
                print("🎥 Video track recebida para \(self.participant.userName)")
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
        } else if let track = receiver.track as? RTCAudioTrack {
            print("🔊 Audio track recebida para \(self.participant.userName)")

            // If this remote track belongs to our own connection id, it is likely a loopback
            // from the server; disable it to avoid hearing our own microphone.
            let localId = SocketManagerService.shared.currentConnectionId
            if self.participant.connectionId == localId {
                print("🔇 Ignorando audio local recebido (loopback) para \(self.participant.userName) id=\(self.participant.connectionId)")
                track.isEnabled = false
                return
            }

            // For remote participants: enable playback and force loudspeaker output
            track.isEnabled = true
            DispatchQueue.main.async {
                do {
                    try AVAudioSession.sharedInstance().overrideOutputAudioPort(.speaker)
                    print("🔊 Audio route set to speaker for participant \(self.participant.userName)")
                } catch {
                    print("❌ Failed to override audio port to speaker: \(error.localizedDescription)")
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
