import SwiftUI

final class WalkyCamerOnboardingRouter: Router, WalkyCamerOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToStreetCam() {
        navigateTo(
            StreetCamMenuRoute(isPresented: isNavigating)
        )
    }
}

