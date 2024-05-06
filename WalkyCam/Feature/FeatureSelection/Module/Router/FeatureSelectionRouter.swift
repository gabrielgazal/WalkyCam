import SwiftUI

final class FeatureSelectionRouter: Router, FeatureSelectionRouterProtocol {

    // MARK: - Public API

    func routeToFeatureInformation() {
        navigateTo(
            FeatureInformationRoute(isPresented: isNavigating)
        )
    }
}

