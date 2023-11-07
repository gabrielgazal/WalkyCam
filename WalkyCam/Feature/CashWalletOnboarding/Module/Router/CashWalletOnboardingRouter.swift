import SwiftUI

final class CashWalletOnboardingRouter: Router, CashWalletOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToCashWallet() {
        navigateTo(
            CashWalletRoute(isPresented: isNavigating)
        )
    }
}
