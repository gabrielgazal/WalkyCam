import SwiftUI

final class FunctionMenuRouter: Router, FunctionMenuRouterProtocol {

    // MARK: - Public API

    func routeToSearchCammer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }

    func routeToScheduleCammer() {
        navigateTo(
            BookWalkycamerRoute(isPresented: isNavigating)
        )
    }
}

