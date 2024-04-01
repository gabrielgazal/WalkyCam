import SwiftUI

final class DigitalTwinsOnboardingRouter: Router, DigitalTwinsOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToMenu() {
        navigateTo(
            DigitalTwinsMenuRoute(isPresented: isNavigating)
        )
    }
}

