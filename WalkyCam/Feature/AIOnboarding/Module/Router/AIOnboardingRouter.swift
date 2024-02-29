import SwiftUI

final class AIOnboardingRouter: Router, AIOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToAIMenu() {
        let accessGranted: Bool = false
        navigateTo(
            ConfigureAccessRoute(isPresented: isNavigating)
        )
    }
}

