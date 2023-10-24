import SwiftUI

final class HomeRouter: Router, HomeRouterProtocol {

    // MARK: - Public API

    func routeToNotifications() {
        navigateTo(
            NotificationsRoute(isPresented: isNavigating)
        )
    }

    func routeToProfile() {}
}
