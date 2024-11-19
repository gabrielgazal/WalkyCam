//
//  VideoManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 19/11/24.
//

import Foundation
import AVFoundation
import SwiftUI

class VideoManager: ObservableObject {
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
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
    }
}
