import SwiftUI

final class StartupRouter: Router, StartupRouterProtocol {

    // MARK: - Public API

    func routeToRegistrationPlans() {
        navigateTo(
            RegistrationPlansRoute(isPresented: isNavigating)
        )
    }
}
