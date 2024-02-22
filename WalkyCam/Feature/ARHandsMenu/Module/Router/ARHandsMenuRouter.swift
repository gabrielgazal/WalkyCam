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
            WebRoute(isPreseted: isNavigating,
                     webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }
    func routeToDigitalTwins() {}
}

