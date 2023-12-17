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
        navigateTo(
            VideoCallRoute(isPresented: isNavigating)
        )
    }
    
    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }
}
