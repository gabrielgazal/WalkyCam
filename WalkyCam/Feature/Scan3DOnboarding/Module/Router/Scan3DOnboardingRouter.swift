import SwiftUI

final class Scan3DOnboardingRouter: Router, Scan3DOnboardingRouterProtocol {

    // MARK: - Public API

    func routeToScan3D() {
        navigateTo(
            Scan3DMenuRoute(isPresented: isNavigating)
        )
    }
}

