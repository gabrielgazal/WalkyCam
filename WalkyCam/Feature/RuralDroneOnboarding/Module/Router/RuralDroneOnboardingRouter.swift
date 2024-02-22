import SwiftUI

final class RuralDroneOnboardingRouter: Router, RuralDroneOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToFlightMenu() {
        navigateTo(
            FlightMenuRoute(isPresented: isNavigating, menuMode: .rural)
        )
    }
}

