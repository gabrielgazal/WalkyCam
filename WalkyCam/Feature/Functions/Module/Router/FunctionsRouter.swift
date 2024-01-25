import SwiftUI

final class FunctionsRouter: Router, FunctionsRouterProtocol {

    // MARK: - Public API

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

    func routeToARHands() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                     webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }
}

