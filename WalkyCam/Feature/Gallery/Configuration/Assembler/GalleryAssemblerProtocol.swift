import SwiftUI

protocol GalleryAssemblerProtocol {
    func resolveView(
        route: GalleryRoute
    ) -> GalleryView<GalleryViewModel, GalleryRouter>
}