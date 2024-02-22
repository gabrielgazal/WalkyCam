import SwiftUI

final class ARHandsMenuRouter: Router, ARHandsMenuRouterProtocol {

    // MARK: - Public API

    func routeToARHands() {
        navigateTo(
            AssistantMenuRoute(isPresented: isNavigating)
        )
    }

    func routeToExternalHands() {
        navigateTo(
            ExternalAssistantRoute(isPresented: isNavigating)
        )
    }
    func routeToDigitalTwins() {}
}

