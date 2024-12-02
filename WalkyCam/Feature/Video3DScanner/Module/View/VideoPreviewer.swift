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
        if let player = makePlayer(from: videoData) {
            playerViewController.player = player
            playerViewController.player?.play() // Opcional: iniciar reprodução automática
        }
        playerViewController.showsPlaybackControls = true
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Não precisa atualizar dinamicamente para este caso
    }

    private func makePlayer(from data: Data) -> AVPlayer? {
        // Gere o caminho do arquivo temporário
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".mov")

        do {
            // Salve o `Data` como um arquivo de vídeo
            try data.write(to: tempURL)
            print("Vídeo salvo em: \(tempURL)") // Para depuração
            return AVPlayer(url: tempURL)
        } catch {
            print("Erro ao salvar o arquivo temporário: \(error)")
            return nil
        }
    }
}
