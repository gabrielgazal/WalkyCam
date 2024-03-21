import SwiftUI

final class PlansPagesRouter: Router, PlansPagesRouterProtocol {

    // MARK: - Public API

    func routeToHome() {
        navigateTo(
            TabBarRoute(isPresented: isNavigating)
        )
    }
}

