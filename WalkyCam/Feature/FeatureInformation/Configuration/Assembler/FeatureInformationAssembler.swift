import SwiftUI

final class FeatureInformationAssembler: FeatureInformationAssemblerProtocol {
    func resolveView(
        route: FeatureInformationRoute
    ) -> FeatureInformationView<FeatureInformationViewModel, FeatureInformationRouter> {

        let router = FeatureInformationRouter(isPresented: route.isPresented)

        let interactor = FeatureInformationInteractor(
            useCases: .init()
        )
        let viewModel = FeatureInformationViewModel(interactor: interactor)
        let view = FeatureInformationView(viewModel: viewModel, router: router)

        return view
    }
}
