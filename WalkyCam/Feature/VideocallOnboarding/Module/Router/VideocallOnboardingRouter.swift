import SwiftUI

final class VideocallOnboardingRouter: Router, VideocallOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToVideoCall() {
        navigateTo(
            VideoCallRoute(isPresented: isNavigating)
        )
    }
}
