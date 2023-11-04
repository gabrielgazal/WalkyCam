import SwiftUI

protocol CashWalletOnboardingAssemblerProtocol {
    func resolveView(
        route: CashWalletOnboardingRoute
    ) -> CashWalletOnboardingView<CashWalletOnboardingViewModel, CashWalletOnboardingRouter>
}