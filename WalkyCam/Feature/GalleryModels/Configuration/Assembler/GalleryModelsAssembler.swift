import SwiftUI

final class GalleryModelsAssembler: GalleryModelsAssemblerProtocol {
    func resolveView(
        route: GalleryModelsRoute
    ) -> GalleryModelsView<GalleryModelsViewModel, GalleryModelsRouter> {

        let router = GalleryModelsRouter(isPresented: route.isPresented)

        let interactor = GalleryModelsInteractor(
            useCases: .init()
        )
        let viewModel = GalleryModelsViewModel(
            galleryItems: route.galleryItems,
            interactor: interactor
        )
        let view = GalleryModelsView(viewModel: viewModel, router: router)

        return view
    }
}
