import SwiftUI

final class GalleryModelsViewModel: GalleryModelsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: GalleryModelsInteractorProtocol
    
    // MARK: - Protocol
    
    @Published var galleryItems: [GalleryItemModel] = []

    // MARK: - Initialization

    init(
        galleryItems: [GalleryItemModel],
        interactor: GalleryModelsInteractorProtocol = GalleryModelsInteractor()
    ) {
        self.galleryItems = galleryItems
        self.interactor = interactor
    }
}
