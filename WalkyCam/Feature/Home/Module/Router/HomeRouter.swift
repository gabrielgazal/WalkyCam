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
        let seenOnboarding: Bool = (try? UserSession().user().configurations.videocallConfiguration) ?? false
        navigateTo(
            seenOnboarding ? VideoCallRoute(isPresented: isNavigating) : VideocallOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkCamer() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.streetcamConfiguration) ?? false
        navigateTo(
            seenOnboarding ? StreetCamMenuRoute(isPresented: isNavigating) : WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToARHands() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.arHandsConfiguration) ?? false
        navigateTo(
            seenOnboarding ? ARHandsMenuRoute(isPresented: isNavigating) : ARHandsOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToDrone() {
        navigateTo(
//            DroneMenuRoute(isPresented: isNavigating)
            DroneConnectionRoute(isPresented: isNavigating)
        )
    }

    func routeToScan3D() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.scan3dConfiguration) ?? false
        navigateTo(
            seenOnboarding ? Scan3DMenuRoute(isPresented: isNavigating) : Scan3DOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToChat() {
        navigateTo(
            ChatListRoute(isPresented: isNavigating)
        )
    }
    
    func routeToRegistrationPlans() {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: 3)
        )
    }
    
    func routeToGallery() {
        navigateTo(
            GalleryRoute(isPresented: isNavigating)
        )
    }
}
