import SwiftUI

final class GalleryPhotosViewModel: GalleryPhotosViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: GalleryPhotosInteractorProtocol
    @Published var photosData: [GalleryPhotosModel] = []

    // MARK: - Initialization

    init(interactor: GalleryPhotosInteractorProtocol = GalleryPhotosInteractor()) {
        self.interactor = interactor
        initializePhotos()
    }

    // MARK: - Private Methods

    private func initializePhotos() {
        photosData = [
            .init(image: Asset.Ads.beach.name, date: .init()),
            .init(image: Asset.Ads.iphone.name, date: .init()),
            .init(image: Asset.Ads.planeTravel.name, date: .distantPast),
            .init(image: Asset.Ads.search.name, date: .distantPast),
            .init(image: Asset.Ads.beach.name, date: .init()),
            .init(image: Asset.Ads.iphone.name, date: .init())
        ]
    }
}
