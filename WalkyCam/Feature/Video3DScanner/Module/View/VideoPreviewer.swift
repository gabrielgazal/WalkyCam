//
//  VideoPreviewer.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 21/11/24.
//

import Foundation
import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoData: Data
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = makePlayer(from: videoData)
        playerViewController.showsPlaybackControls = true
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Não há necessidade de atualização dinâmica
    }
    
    private func makePlayer(from data: Data) -> AVPlayer? {
        // Salve o arquivo temporário
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("tempVideo.mp4")
        
        do {
            try data.write(to: tempURL)
            return AVPlayer(url: tempURL)
        } catch {
            print("Erro ao salvar o arquivo temporário: \(error)")
            return nil
        }
    }
}
