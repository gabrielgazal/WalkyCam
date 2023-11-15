import SwiftUI

protocol GalleryPhotosAssemblerProtocol {
    func resolveView(
        route: GalleryPhotosRoute
    ) -> GalleryPhotosView<GalleryPhotosViewModel, GalleryPhotosRouter>
}