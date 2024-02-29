import SwiftUI

final class AIMenuRouter: Router, AIMenuRouterProtocol {

    // MARK: - Public API

    func routeToWalkyBot() {
        navigateTo(
            WalkyBotRoute(isPresented: isNavigating)
        )
    }
}

