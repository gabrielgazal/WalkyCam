import SwiftUI

final class FeatureSelectionAssembler: FeatureSelectionAssemblerProtocol {
    func resolveView(
        route: FeatureSelectionRoute
    ) -> FeatureSelectionView<FeatureSelectionViewModel, FeatureSelectionRouter> {

        let router = FeatureSelectionRouter(isPresented: route.isPresented)

        let interactor = FeatureSelectionInteractor(
            useCases: .init()
        )
        let viewModel = FeatureSelectionViewModel(interactor: interactor)
        let view = FeatureSelectionView(viewModel: viewModel, router: router)

        return view
    }
}
