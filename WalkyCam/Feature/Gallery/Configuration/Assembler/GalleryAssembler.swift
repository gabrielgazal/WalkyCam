import SwiftUI

final class GalleryAssembler: GalleryAssemblerProtocol {
    func resolveView(
        route: GalleryRoute
    ) -> GalleryView<GalleryViewModel, GalleryRouter> {

        let router = GalleryRouter(isPresented: route.isPresented)

        let interactor = GalleryInteractor(
            useCases: .init()
        )
        let viewModel = GalleryViewModel(interactor: interactor)
        let view = GalleryView(viewModel: viewModel, router: router)

        return view
    }
}
