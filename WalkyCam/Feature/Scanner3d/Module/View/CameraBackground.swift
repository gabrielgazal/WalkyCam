//
//  CameraBackground.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct CameraBackground: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

class CameraManager: ObservableObject {
    let session = AVCaptureSession()

    init() {
        setupSession()
    }

    private func setupSession() {
        session.sessionPreset = .high
        
        // Configuração da câmera traseira
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(input) {
                session.addInput(input)
            }
        } catch {
            print("Erro ao configurar entrada da câmera: \(error)")
        }
        
        session.startRunning()
    }
}
