import SwiftUI

final class SpecialistNotifiedRouter: Router, SpecialistNotifiedRouterProtocol {

    // MARK: - Public API

    func routeToARHands() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                     webViewURL: "https://vcprojectj4g.com/static/main/")
        )
    }
}

