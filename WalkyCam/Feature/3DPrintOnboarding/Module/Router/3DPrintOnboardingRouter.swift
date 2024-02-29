import SwiftUI

final class _DPrintOnboardingRouter: Router, _DPrintOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToPrint() {
        navigateTo(
            PrintMenuRoute(isPresented: isNavigating)
        )
    }
}

