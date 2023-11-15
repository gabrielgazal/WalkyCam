import SwiftUI

final class GalleryPhotosAssembler: GalleryPhotosAssemblerProtocol {
    func resolveView(
        route: GalleryPhotosRoute
    ) -> GalleryPhotosView<GalleryPhotosViewModel, GalleryPhotosRouter> {

        let router = GalleryPhotosRouter(isPresented: route.isPresented)

        let interactor = GalleryPhotosInteractor(
            useCases: .init()
        )
        let viewModel = GalleryPhotosViewModel(interactor: interactor)
        let view = GalleryPhotosView(viewModel: viewModel, router: router)

        return view
    }
}
