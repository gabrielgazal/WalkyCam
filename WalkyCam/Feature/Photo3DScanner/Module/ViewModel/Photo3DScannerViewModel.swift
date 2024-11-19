import SwiftUI

final class Photo3DScannerViewModel: Photo3DScannerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: Scanner3dInteractorProtocol
    
    @Published var capturedImages: [UIImage] = []
    @Published var showImagePicker: Bool = false
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
            let convertedImages = capturedImages.compactMap { $0.jpegData(compressionQuality: 0.8) }
            _ = try await interactor.generateModelFromPhotos(input: convertedImages)
            scanState = .loaded(Data())
            onSuccess?()
        } catch {
            scanState = .failed(GenericError())
            onFailure?()
        }
    }
    
    func addImage(_ image: UIImage) {
        capturedImages.append(image)
    }
    
    func clearImages() {
        capturedImages.removeAll()
    }
}
