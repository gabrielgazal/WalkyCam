import SwiftUI

final class ARHandsMenuRouter: Router, ARHandsMenuRouterProtocol {

    // MARK: - Public API

    func routeToARHands() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                     webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }

    func routeToExternalHands() {}
    func routeToDigitalTwins() {}
}

