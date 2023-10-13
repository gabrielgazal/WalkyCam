import SwiftUI

final class LoginRouter: Router, LoginRouterProtocol {

    // MARK: - Public API

    func routeToOnboarding() {
        navigateTo(
            OnboardingRoute(isPresented: isNavigating)
        )
    }
}
