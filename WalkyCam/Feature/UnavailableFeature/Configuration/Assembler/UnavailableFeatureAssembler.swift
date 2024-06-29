import SwiftUI

final class UnavailableFeatureAssembler: UnavailableFeatureAssemblerProtocol {
    func resolveView(
        route: UnavailableFeatureRoute
    ) -> UnavailableFeatureView<UnavailableFeatureViewModel, UnavailableFeatureRouter> {

        let router = UnavailableFeatureRouter(isPresented: route.isPresented)

        let interactor = UnavailableFeatureInteractor(
            useCases: .init()
        )
        let viewModel = UnavailableFeatureViewModel(
            icon: route.icon,
            title: route.title
        )
        let view = UnavailableFeatureView(viewModel: viewModel, router: router)

        return view
    }
}
