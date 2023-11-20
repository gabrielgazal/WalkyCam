import SwiftUI

final class RegistrationPlansRouter: Router, RegistrationPlansRouterProtocol {

    // MARK: - Public API

    func routeToPlansPages(_ currentPage: Int) {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: currentPage)
        )
    }
}
