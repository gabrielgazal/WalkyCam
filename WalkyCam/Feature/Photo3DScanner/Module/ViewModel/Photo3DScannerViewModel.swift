import SwiftUI

final class Photo3DScannerViewModel: Photo3DScannerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: Scanner3dInteractorProtocol
    
    @Published var capturedImages: [String: UIImage] = [:]
    @Published var showImagePicker: Bool = true
    @Published var scanState: AsyncData<Data, ErrorProtocol> = .idle
    
    // MARK: - Initialization

    init(interactor: Scanner3dInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API
    
    @MainActor func generateModelFromPhotos(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        scanState = .loading
        do {
            guard !capturedImages.isEmpty else { return }
            let convertedImages = capturedImages.compactMap { $0.value.jpegData(compressionQuality: 0.8) }
            var mappedImages = [String: Data]()
            for (index, image) in convertedImages.enumerated() {
                switch index {
                case 0:
                    mappedImages.updateValue(image, forKey: "front")
                case 1:
                    mappedImages.updateValue(image, forKey: "back")
                case 2:
                    mappedImages.updateValue(image, forKey: "left")
                case 3:
                    mappedImages.updateValue(image, forKey: "right")
                default: break
                }
            }
            _ = try await interactor.generateModelFromPhotos(input: mappedImages)
            scanState = .loaded(Data())
            onSuccess?()
        } catch {
            scanState = .failed(GenericError())
            onFailure?()
        }
    }
    
    func addImage(_ image: UIImage, for position: String) {
        capturedImages[position] = image
    }
    
    func imageForPosition(_ position: String) -> UIImage? {
        return capturedImages[position]
    }

    func clearAllImages() {
        capturedImages.removeAll()
    }
}
