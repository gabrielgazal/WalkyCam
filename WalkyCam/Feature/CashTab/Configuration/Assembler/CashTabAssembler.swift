import SwiftUI

final class CashTabAssembler: CashTabAssemblerProtocol {
    func resolveView(
        route: CashTabRoute
    ) -> CashTabView<CashTabViewModel, CashTabRouter> {

        let router = CashTabRouter(isPresented: route.isPresented)

        let interactor = CashTabInteractor(
            useCases: .init()
        )
        let viewModel = CashTabViewModel(interactor: interactor)
        let view = CashTabView(viewModel: viewModel, router: router)

        return view
    }
}
