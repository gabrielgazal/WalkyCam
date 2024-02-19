import SwiftUI

final class ARHandsOnboardingRouter: Router, ARHandsOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToARHandsMenu() {
        navigateTo(
            ARHandsMenuRoute(isPresented: isNavigating)
        )
    }
}

