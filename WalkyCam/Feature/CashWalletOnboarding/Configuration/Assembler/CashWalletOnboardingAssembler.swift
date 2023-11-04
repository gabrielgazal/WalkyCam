import SwiftUI

final class CashWalletOnboardingAssembler: CashWalletOnboardingAssemblerProtocol {
    func resolveView(
        route: CashWalletOnboardingRoute
    ) -> CashWalletOnboardingView<CashWalletOnboardingViewModel, CashWalletOnboardingRouter> {

        let router = CashWalletOnboardingRouter(isPresented: route.isPresented)

        let interactor = CashWalletOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = CashWalletOnboardingViewModel(interactor: interactor)
        let view = CashWalletOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
