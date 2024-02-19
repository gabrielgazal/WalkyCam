import SwiftUI

final class DroneMenuRouter: Router, DroneMenuRouterProtocol {

    // MARK: - Public API

    func routeToDrone() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations?.drone) ?? false
        navigateTo(
            DroneOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToRuralDrone() {}

    func routeToLidar() {}
}

