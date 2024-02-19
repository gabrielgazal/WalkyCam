import SwiftUI

final class FunctionsRouter: Router, FunctionsRouterProtocol {

    // MARK: - Public API

    func routeToVideoCall() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations?.streetCam) ?? false
        navigateTo(
            seenOnboarding ? VideoCallRoute(isPresented: isNavigating) : VideocallOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToARHands() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations?.ARHands) ?? false
        navigateTo(
            seenOnboarding ? ARHandsMenuRoute(isPresented: isNavigating) : ARHandsOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToDrone() {
        navigateTo(
            DroneOnboardingRoute(isPresented: isNavigating)
        )
    }
}

