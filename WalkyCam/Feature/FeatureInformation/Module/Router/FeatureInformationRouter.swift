import SwiftUI

final class FeatureInformationRouter: Router, FeatureInformationRouterProtocol {

    // MARK: - Public API

    func routeToAvailability() {
        navigateTo(
            CamerAvailabilityRoute(isPresented: isNavigating)
        )
    }
}

