import SwiftUI

final class LidarOnboardingRouter: Router, LidarOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToFlightMenu() {
        navigateTo(
            FlightMenuRoute(isPresented: isNavigating, menuMode: .lidar)
        )
    }
}

