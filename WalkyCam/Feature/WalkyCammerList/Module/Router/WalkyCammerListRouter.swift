import SwiftUI

final class WalkyCammerListRouter: Router, WalkyCammerListRouterProtocol {

    // MARK: - Public API

    func routeToCamerDetail(_ data: CammerData) {
        navigateTo(
            CammerDetailsRoute(isPresented: isNavigating, cammerData: data)
        )
    }
}

