import SwiftUI

final class ConfigureAccessRouter: Router, ConfigureAccessRouterProtocol {

    // MARK: - Public API

    func routeToAIMenu() {
        navigateTo(
            AIMenuRoute(isPresented: isNavigating)
        )
    }
}

