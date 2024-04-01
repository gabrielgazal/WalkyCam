import SwiftUI

final class DigitalTwinsMenuRouter: Router, DigitalTwinsMenuRouterProtocol {

    // MARK: - Public API

    func routeToSearchCammer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }

    func routeToBookCammer() {
        navigateTo(
            BookWalkycamerRoute(isPresented: isNavigating)
        )
    }
}

