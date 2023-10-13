import SwiftUI

final class OnboardingRouter: Router, OnboardingRouterProtocol {

    // MARK: - Public API

    func routeToRegistration() {
        navigateTo(
            RegistrationRoute(isPresented: isNavigating)
        )
    }
}

