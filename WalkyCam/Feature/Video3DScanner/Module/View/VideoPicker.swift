import SwiftUI
import AVFoundation
import UIKit

struct VideoPicker: UIViewControllerRepresentable {
    // Bindings para controle externo
    @Binding var isPresented: Bool
    @Binding var videoData: Data?

    /// Cria o controlador de vídeo
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.mediaTypes = [UTType.movie.identifier] // Usa uniform type identifier (UTI)
        picker.videoQuality = .typeHigh
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Não há necessidade de atualizar nada no momento
    }

    /// Cria o coordenador que gerencia as interações com o UIImagePickerController
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: VideoPicker

        init(_ parent: VideoPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            defer { parent.isPresented = false } // Fecha o picker ao terminar

            guard let videoURL = info[.mediaURL] as? URL else {
                print("Erro: URL do vídeo não encontrada.")
                return
            }

            do {
                // Converte o vídeo para Data
                let videoData = try Data(contentsOf: videoURL)
                parent.videoData = videoData
            } catch {
                print("Erro ao converter vídeo para Data: \(error)")
                parent.videoData = nil // Garante que não há dados inválidos
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false // Fecha o picker ao cancelar
        }
    }
}
