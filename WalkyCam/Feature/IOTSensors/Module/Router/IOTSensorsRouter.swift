import SwiftUI

final class IOTSensorsRouter: Router, IOTSensorsRouterProtocol {

    // MARK: - Public API

    func routeToSearchWalkcamer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }
}

