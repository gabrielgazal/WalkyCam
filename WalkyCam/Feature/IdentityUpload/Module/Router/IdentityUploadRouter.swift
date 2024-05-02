import SwiftUI

final class IdentityUploadRouter: Router, IdentityUploadRouterProtocol {

    // MARK: - Public API

    func routeToFeatures() {
        navigateTo(
            FeatureSelectionRoute(isPresented: isNavigating)
        )
    }
}

