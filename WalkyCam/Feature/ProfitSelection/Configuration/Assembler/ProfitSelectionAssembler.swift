import SwiftUI

final class ProfitSelectionAssembler: ProfitSelectionAssemblerProtocol {
    func resolveView(
        route: ProfitSelectionRoute
    ) -> ProfitSelectionView<ProfitSelectionViewModel, ProfitSelectionRouter> {

        let router = ProfitSelectionRouter(isPresented: route.isPresented)

        let interactor = ProfitSelectionInteractor(
            useCases: .init()
        )
        let viewModel = ProfitSelectionViewModel(interactor: interactor,
                                                 registrationData: route.registrationData)
        let view = ProfitSelectionView(viewModel: viewModel, router: router)

        return view
    }
}
