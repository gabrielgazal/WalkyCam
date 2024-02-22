import SwiftUI

final class HomeRouter: Router, HomeRouterProtocol {

    // MARK: - Public API

    func routeToNotifications() {
        navigateTo(
            NotificationsRoute(isPresented: isNavigating)
        )
    }

    func routeToProfile() {
        navigateTo(
            ProfileRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkyBot() {
        navigateTo(
            WalkyBotRoute(isPresented: isNavigating)
        )
    }

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
            DroneMenuRoute(isPresented: isNavigating)
        )
    }

    func routeToScan3D() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations?.scan3D) ?? false
        navigateTo(
            seenOnboarding ? Scan3DMenuRoute(isPresented: isNavigating) : Scan3DOnboardingRoute(isPresented: isNavigating)
        )
    }
}
