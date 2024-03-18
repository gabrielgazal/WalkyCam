import SwiftUI

final class UnreleasedFeatureAssembler: UnreleasedFeatureAssemblerProtocol {
    func resolveView(
        route: UnreleasedFeatureRoute
    ) -> UnreleasedFeatureView<UnreleasedFeatureViewModel, UnreleasedFeatureRouter> {

        let router = UnreleasedFeatureRouter(isPresented: route.isPresented)

        let interactor = UnreleasedFeatureInteractor(
            useCases: .init()
        )
        let viewModel = UnreleasedFeatureViewModel(interactor: interactor,
                                                   banners: route.banners)
        let view = UnreleasedFeatureView(viewModel: viewModel, router: router)

        return view
    }
}
