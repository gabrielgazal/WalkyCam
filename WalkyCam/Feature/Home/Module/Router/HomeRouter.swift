import SwiftUI

final class HomeRouter: Router, HomeRouterProtocol {

    // MARK: - Public API

    func routeToChat() {
        navigateTo(
            ChatRoute(isPresented: isNavigating)
        )
    }

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
            seenOnboarding ? VideoCallRoute(isPresented: isNavigating) : WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToARHands() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                     webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }
}
