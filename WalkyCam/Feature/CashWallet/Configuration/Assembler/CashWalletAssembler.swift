import SwiftUI

final class CashWalletAssembler: CashWalletAssemblerProtocol {
    func resolveView(
        route: CashWalletRoute
    ) -> CashWalletView<CashWalletViewModel, CashWalletRouter> {

        let router = CashWalletRouter(isPresented: route.isPresented)

        let interactor = CashWalletInteractor(
            useCases: .init()
        )
        let viewModel = CashWalletViewModel(interactor: interactor)
        let view = CashWalletView(viewModel: viewModel, router: router)

        return view
    }
}
