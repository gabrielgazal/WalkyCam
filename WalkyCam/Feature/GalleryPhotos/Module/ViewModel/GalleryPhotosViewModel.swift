import SwiftUI

final class GalleryPhotosViewModel: GalleryPhotosViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: GalleryPhotosInteractorProtocol
    @Published var photosData: [GalleryItemModel]

    // MARK: - Initialization

    init(interactor: GalleryPhotosInteractorProtocol = GalleryPhotosInteractor(),
         photosData: [GalleryItemModel]) {
        self.interactor = interactor
        self.photosData = photosData
    }
}
