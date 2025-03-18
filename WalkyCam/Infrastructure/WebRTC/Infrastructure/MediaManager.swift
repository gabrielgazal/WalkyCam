//
//  MediaManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/03/25.
//

import Foundation
import WebRTC
import AVFoundation

class MediaManager: NSObject, ObservableObject {
    static let shared = MediaManager()
    
    private var factory: RTCPeerConnectionFactory
    private var videoCapturer: RTCCameraVideoCapturer?
    private var videoSource: RTCVideoSource?
    private var audioSource: RTCAudioSource?
    
    @Published var localVideoTrack: RTCVideoTrack?
    @Published var localAudioTrack: RTCAudioTrack?
    
    private override init() {
        self.factory = RTCPeerConnectionFactory()
        super.init()
        
        self.setupAudio()
        self.setupVideo()
    }
    
    // Configuração do microfone
    private func setupAudio() {
        let audioConstraints = RTCMediaConstraints(mandatoryConstraints: nil, optionalConstraints: nil)
        self.audioSource = factory.audioSource(with: audioConstraints)
        self.localAudioTrack = factory.audioTrack(with: audioSource!, trackId: "audio0")
    }
    
    // Configuração da câmera
    private func setupVideo() {
        self.videoSource = factory.videoSource()
        self.videoCapturer = RTCCameraVideoCapturer(delegate: videoSource!)
        
        self.localVideoTrack = factory.videoTrack(with: videoSource!, trackId: "video0")
    }
    
    // Inicia a captura de vídeo
    func startCapture(sessionPreset: AVCaptureSession.Preset = .medium, position: AVCaptureDevice.Position = .front) {
        guard let device = getCameraDevice(for: position) else {
            print("Câmera não encontrada para posição \(position)")
            return
        }
        
        guard let format = device.formats.last else { return }
        let fps = format.videoSupportedFrameRateRanges.first!.maxFrameRate
        
        videoCapturer?.startCapture(with: device, format: format, fps: Int(fps))
    }
    
    // Alterna entre câmera frontal/traseira
    func switchCamera() {
        guard let currentInput = videoCapturer?.captureSession.inputs.first as? AVCaptureDeviceInput else {
            print("Nenhuma câmera disponível!")
            return
        }
        
        let newPosition: AVCaptureDevice.Position = (currentInput.device.position == .front) ? .back : .front
        startCapture(position: newPosition)
    }
    
    // Obtém a câmera correta com base na posição
    private func getCameraDevice(for position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        let devices = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera, .builtInTripleCamera],
            mediaType: .video,
            position: position
        ).devices
        
        return devices.first
    }
}
