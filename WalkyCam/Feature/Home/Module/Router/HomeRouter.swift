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
            VideocallOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToARHands() {
        navigateTo(
            ARHandsOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToDrone() {
        navigateTo(
            //            DroneMenuRoute(isPresented: isNavigating)
            DroneConnectionRoute(isPresented: isNavigating)
        )
    }
    
    func routeToScan3D() {
        navigateTo(
            Scan3DOnboardingRoute(isPresented: isNavigating)
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
