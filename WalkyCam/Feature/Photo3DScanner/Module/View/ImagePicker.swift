import SwiftUI
import UIKit
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    var completion: ([UIImage]) -> Void
    var maxSelections: Int = 4

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        // Verifica se o source type está disponível
        if sourceType == .camera {
            // Verifica se a câmera está disponível
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.sourceType = sourceType
                picker.delegate = context.coordinator
                return picker
            } else {
                // Se a câmera não estiver disponível, volta para a biblioteca
                return createPhotoLibraryPicker(context: context)
            }
        } else {
            return createPhotoLibraryPicker(context: context)
        }
    }
    
    private func createPhotoLibraryPicker(context: Context) -> UIViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = maxSelections
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        // MARK: - UIImagePickerControllerDelegate (para camera)
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.completion([image])
            } else {
                parent.completion([])
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.completion([])
            picker.dismiss(animated: true)
        }

        // MARK: - PHPickerViewControllerDelegate (para biblioteca de fotos)
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard !results.isEmpty else {
                parent.completion([])
                return
            }
            
            var images: [UIImage] = []
            let group = DispatchGroup()
            
            for result in results {
                group.enter()
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    defer { group.leave() }
                    
                    if let image = object as? UIImage {
                        DispatchQueue.main.async {
                            images.append(image)
                        }
                    }
                }
            }
            
            group.notify(queue: .main) {
                self.parent.completion(images)
            }
        }
    }
}

// MARK: - Helper para verificar disponibilidade da câmera
extension UIImagePickerController {
    static var isCameraAvailable: Bool {
        return isSourceTypeAvailable(.camera)
    }
}
