import SwiftUI

final class DroneMenuRouter: Router, DroneMenuRouterProtocol {

    // MARK: - Public API

    func routeToDrone() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.droneConfiguration) ?? false
        navigateTo(
            DroneOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToRuralDrone() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.droneConfiguration) ?? false
        navigateTo(
            RuralDroneOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToLidar() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.droneConfiguration) ?? false
        navigateTo(
            LidarOnboardingRoute(isPresented: isNavigating)
        )
    }
}

