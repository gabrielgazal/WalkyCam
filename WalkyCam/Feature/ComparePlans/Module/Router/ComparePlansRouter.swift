import SwiftUI

final class ComparePlansRouter: Router, ComparePlansRouterProtocol {

    // MARK: - Public API

    func routeToPlansPages(_ currentPage: Int?) {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: currentPage ?? 0)
        )
    }
}
