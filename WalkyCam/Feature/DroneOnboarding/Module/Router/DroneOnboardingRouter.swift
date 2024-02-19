import SwiftUI

final class DroneOnboardingRouter: Router, DroneOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToFlightMenu() {
        navigateTo(
            FlightMenuRoute(isPresented: isNavigating)
        )
    }
}

