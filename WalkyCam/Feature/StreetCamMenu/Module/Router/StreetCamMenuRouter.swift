import SwiftUI

final class StreetCamMenuRouter: Router, StreetCamMenuRouterProtocol {

    // MARK: - Public API

    func routeToSearchCammer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }
}

