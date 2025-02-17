import SwiftUI

protocol GalleryModelsAssemblerProtocol {
    func resolveView(
        route: GalleryModelsRoute
    ) -> GalleryModelsView<GalleryModelsViewModel, GalleryModelsRouter>
}