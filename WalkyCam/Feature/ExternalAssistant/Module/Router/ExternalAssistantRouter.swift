import SwiftUI

final class ExternalAssistantRouter: Router, ExternalAssistantRouterProtocol {

    // MARK: - Public API

    func  routeToARHands() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                            webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }
}

