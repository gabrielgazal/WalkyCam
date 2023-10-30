import SwiftUI

final class ConfirmMailRouter: Router, ConfirmMailRouterProtocol {

    // MARK: - Public API

    func routeToStartup() {
        navigateTo(
            StartupRoute(isPresented: isNavigating)
        )
    }
}
