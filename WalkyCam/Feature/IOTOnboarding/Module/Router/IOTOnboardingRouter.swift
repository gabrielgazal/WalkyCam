import SwiftUI

final class IOTOnboardingRouter: Router, IOTOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToIOT() {
        navigateTo(
            IOTMenuRoute(isPresented: isNavigating)
        )
    }
}

