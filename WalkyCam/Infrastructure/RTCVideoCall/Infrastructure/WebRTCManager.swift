//
//  WebRTCManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/04/25.
//

import Foundation
import WebRTC
import AVFoundation

class WebRTCManager: NSObject {
    static let shared = WebRTCManager()
    
    private var peerConnections: [String: RTCPeerConnection] = [:]
    private var videoTracks: [String: RTCVideoTrack] = [:]
    
    private let factory: RTCPeerConnectionFactory
    private var localVideoSource: RTCVideoSource?
    private var localCapturer: RTCCameraVideoCapturer?
    
    var localVideoTrack: RTCVideoTrack?
    var localAudioTrack: RTCAudioTrack?
    
    private var videoReader: AVAssetReader?
    private var readerOutput: AVAssetReaderTrackOutput?
    private var displayLink: CADisplayLink?
    
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
        
        let capturer = RTCCameraVideoCapturer(delegate: self)
        self.localCapturer = capturer
        
        localVideoTrack?.isEnabled = true
        
        startCapture()
    }
    
    private func startCapture() {
        updateCameraSource(width: 1280, height: 720, fps: 30)
    }
    
    func createPeerConnection(for participant: Participant) {
        let config = RTCConfiguration()
        config.iceServers = [
            RTCIceServer(urlStrings: ["stun:stun.l.google.com:19302"])
        ]
        config.sdpSemantics = .unifiedPlan

        let constraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        guard let connection = factory.peerConnection(with: config, constraints: constraints, delegate: self) else {
            print("❌ Falha ao criar PeerConnection")
            return
        }

        if let videoTrack = localVideoTrack {
            print("✅ Adicionando track de vídeo local à conexão para \(participant.connectionId)")
            let videoInit = RTCRtpTransceiverInit()
            videoInit.direction = .sendRecv
            videoTrack.isEnabled = true
            _ = connection.addTransceiver(with: videoTrack, init: videoInit)
            _ = connection.add(videoTrack, streamIds: ["localVideo"])
        } else {
            print("❌ Track de vídeo local não disponível para adicionar à conexão")
        }

        if let audioTrack = localAudioTrack {
            print("✅ Adicionando track de áudio local à conexão para \(participant.connectionId)")
            let audioInit = RTCRtpTransceiverInit()
            audioInit.direction = .sendRecv
            _ = connection.addTransceiver(with: audioTrack, init: audioInit)
            _ = connection.add(audioTrack, streamIds: ["localAudio"])
        }

        peerConnections[participant.connectionId] = connection
    }

    func generateOffer(for connectionId: String, completion: @escaping (RTCSessionDescription?) -> Void) {
        guard let connection = peerConnections[connectionId] else {
            print("❌ Connection não encontrada para \(connectionId)")
            completion(nil)
            return
        }
        
        // Garante que oferecemos e solicitamos áudio e vídeo
        let constraints = RTCMediaConstraints(
            mandatoryConstraints: [
                "OfferToReceiveAudio": "true",
                "OfferToReceiveVideo": "true"
            ],
            optionalConstraints: nil
        )
        
        print("🔄 Gerando oferta para \(connectionId)")
        connection.offer(for: constraints) { offer, error in
            guard let offer = offer else {
                print("❌ Erro ao gerar oferta: \(error?.localizedDescription ?? "Desconhecido")")
                completion(nil)
                return
            }
            
            print("✅ Oferta SDP gerada com sucesso")
            
            // Adiciona log detalhado para depuração
            print("📝 SDP da oferta: \(offer.sdp)")
            
            connection.setLocalDescription(offer) { error in
                if let error = error {
                    print("❌ Erro ao definir descrição local: \(error.localizedDescription)")
                } else {
                    print("✅ Descrição local definida com sucesso")
                }
                completion(offer)
            }
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
    
    func updateCameraSource(width: Int32 = 1280, height: Int32 = 720, fps: Int = 30) {
        guard let capturer = self.localCapturer else { return }
        
        // Stop existing capture if running
        capturer.stopCapture {
            // Código após parar a captura
            
            // Get available capture devices
            let devices = RTCCameraVideoCapturer.captureDevices()
            
            // Default to front camera
            let position: AVCaptureDevice.Position = .front
            
            // Find the device with specified position
            guard let device = devices.first(where: {
                return $0.position == position
            }) else {
                print("❌ No camera found with position: \(position)")
                return
            }
            
            // Find the format that matches our desired resolution
            let formats = RTCCameraVideoCapturer.supportedFormats(for: device)
            var selectedFormat: AVCaptureDevice.Format?
            
            // Select the format closest to our desired resolution
            for format in formats {
                let dimensions = CMVideoFormatDescriptionGetDimensions(format.formatDescription)
                if dimensions.width == width && dimensions.height == height {
                    selectedFormat = format
                    break
                }
            }
            
            // If we didn't find an exact match, take the highest resolution available
            if selectedFormat == nil {
                selectedFormat = formats.max(by: { first, second in
                    let firstDimensions = CMVideoFormatDescriptionGetDimensions(first.formatDescription)
                    let secondDimensions = CMVideoFormatDescriptionGetDimensions(second.formatDescription)
                    
                    return firstDimensions.width * firstDimensions.height < secondDimensions.width * secondDimensions.height
                })
            }
            
            guard let format = selectedFormat else {
                print("❌ No suitable format found")
                return
            }
            
            // Find the highest FPS for this format that doesn't exceed our desired FPS
            var maxFps = 0
            for fpsRange in format.videoSupportedFrameRateRanges {
                if fpsRange.maxFrameRate > Float64(maxFps) && fpsRange.maxFrameRate <= Float64(fps) {
                    maxFps = Int(fpsRange.maxFrameRate)
                }
            }
            
            // If no suitable FPS was found, use the lowest available
            if maxFps == 0, let minRange = format.videoSupportedFrameRateRanges.min(by: { $0.minFrameRate < $1.minFrameRate }) {
                maxFps = Int(minRange.minFrameRate)
            }
            
            // Start capture with selected parameters
            print("🎥 Starting capture with device: \(device.localizedName), format: \(format), fps: \(maxFps)")
            capturer.startCapture(with: device, format: format, fps: Int(maxFps)) { error in
                if let error = error {
                    print("❌ Error starting capture: \(error)")
                } else {
                    print("✅ Camera capture started successfully")
                }
            }
        }
    }
    func switchCamera() {
        guard let capturer = self.localCapturer else { return }
        
        // Primeiro precisamos obter o dispositivo atual
        let devices = RTCCameraVideoCapturer.captureDevices()
        // Como não podemos acessar `capturer.device` diretamente, vamos usar uma alternativa
        
        // Para isso, pegamos as sessions de captura
        guard let currentSession = capturer.captureSession.inputs.first as? AVCaptureDeviceInput else {
            print("❌ Não foi possível obter o dispositivo atual")
            return
        }
        
        let currentDevice = currentSession.device
        
        // Determinar qual posição mudar
        let newPosition: AVCaptureDevice.Position = currentDevice.position == .front ? .back : .front
        
        // Corrigir a assinatura do método stopCapture
        capturer.stopCapture {
            // Find device with the new position
            guard let newDevice = devices.first(where: { $0.position == newPosition }) else {
                print("❌ Não foi possível encontrar câmera com posição: \(newPosition)")
                return
            }
            
            // Find suitable format for the new device
            guard let format = RTCCameraVideoCapturer.supportedFormats(for: newDevice).first else {
                print("❌ Não foi possível encontrar formato adequado para a câmera")
                return
            }
            
            // Get maximum supported FPS for this format
            guard let maxFpsRange = format.videoSupportedFrameRateRanges.max(by: {
                $0.maxFrameRate < $1.maxFrameRate
            }) else {
                print("❌ Não foi possível determinar FPS")
                return
            }
            
            let fps = min(Int(maxFpsRange.maxFrameRate), 30)
            
            // Start capture with new device
            capturer.startCapture(with: newDevice, format: format, fps: fps) { error in
                if let error = error {
                    print("❌ Erro ao mudar de câmera: \(error)")
                } else {
                    print("✅ Câmera mudada para \(newPosition == .front ? "frontal" : "traseira")")
                }
            }
        }
    }
    
    func ensureLocalTracksAreAdded() {
        for (connectionId, connection) in peerConnections {
            print("🔄 Verificando tracks para conexão \(connectionId)")
            
            // Verificar se o vídeo já está adicionado
            let videoAdded = connection.senders.contains { sender in
                return sender.track?.kind == "video"
            }
            
            // Verificar se o áudio já está adicionado
            let audioAdded = connection.senders.contains { sender in
                return sender.track?.kind == "audio"
            }
            
            // Adicionar vídeo se não estiver presente
            if !videoAdded, let videoTrack = localVideoTrack {
                print("➕ Adicionando track de vídeo para \(connectionId)")
                _ = connection.add(videoTrack, streamIds: ["stream-\(SocketManagerService.shared.localConnectionId)"])
            }
            
            // Adicionar áudio se não estiver presente
            if !audioAdded, let audioTrack = localAudioTrack {
                print("➕ Adicionando track de áudio para \(connectionId)")
                _ = connection.add(audioTrack, streamIds: ["stream-\(SocketManagerService.shared.localConnectionId)"])
            }
            
            // Verificar após a adição
            checkConnectionState(for: connectionId)
        }
    }
    
    func checkConnectionState(for connectionId: String) {
        guard let connection = peerConnections[connectionId] else {
            print("❌ Não foi possível encontrar conexão para \(connectionId)")
            return
        }
        
        let iceState = connection.iceConnectionState
        let connectionState = connection.connectionState
        let signalingState = connection.signalingState
        
        print("🔍 Estado da conexão \(connectionId):")
        print("   - ICE: \(describeIceState(iceState))")
        print("   - Connection: \(describeConnectionState(connectionState))")
        print("   - Signaling: \(describeSignalingState(signalingState))")
        
        // Verifica senders (tracks enviados)
        let senders = connection.senders
        print("   - Tracks enviados: \(senders.count)")
        for (index, sender) in senders.enumerated() {
            print("     \(index+1). Track: \(sender.track?.kind ?? "nil") - \(sender.track?.isEnabled ?? false ? "enabled" : "disabled")")
        }
        
        // Verifica receivers (tracks recebidos)
        let receivers = connection.receivers
        print("   - Tracks recebidos: \(receivers.count)")
        for (index, receiver) in receivers.enumerated() {
            print("     \(index+1). Track: \(receiver.track?.kind ?? "nil")")
        }
    }

    // Métodos auxiliares para exibir estados de forma legível
    private func describeIceState(_ state: RTCIceConnectionState) -> String {
        switch state {
        case .new: return "new"
        case .checking: return "checking"
        case .connected: return "connected"
        case .completed: return "completed"
        case .failed: return "failed"
        case .disconnected: return "disconnected"
        case .closed: return "closed"
        case .count: return "count"
        @unknown default: return "unknown"
        }
    }

    private func describeConnectionState(_ state: RTCPeerConnectionState) -> String {
        switch state {
        case .new: return "new"
        case .connecting: return "connecting"
        case .connected: return "connected"
        case .disconnected: return "disconnected"
        case .failed: return "failed"
        case .closed: return "closed"
        @unknown default: return "unknown"
        }
    }

    private func describeSignalingState(_ state: RTCSignalingState) -> String {
        switch state {
        case .stable: return "stable"
        case .haveLocalOffer: return "haveLocalOffer"
        case .haveLocalPrAnswer: return "haveLocalPrAnswer"
        case .haveRemoteOffer: return "haveRemoteOffer"
        case .haveRemotePrAnswer: return "haveRemotePrAnswer"
        case .closed: return "closed"
        @unknown default: return "unknown"
        }
    }
}

extension WebRTCManager: RTCPeerConnectionDelegate {
    func peerConnection(_ peerConnection: RTCPeerConnection, didGenerate candidate: RTCIceCandidate) {
        guard let connectionId = peerConnections.first(where: { $0.value == peerConnection })?.key else {
            print("❌ Não foi possível encontrar connectionId para o candidato ICE")
            return
        }
        
        print("🧊 Candidato ICE gerado para \(connectionId): \(candidate.sdp)")
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
        localVideoSource?.capturer(capturer, didCapture: frame)
//        print("📸 Frame capturado")
    }
}
