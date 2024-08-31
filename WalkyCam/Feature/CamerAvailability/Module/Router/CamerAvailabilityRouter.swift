import SwiftUI

final class CamerAvailabilityRouter: Router, CamerAvailabilityRouterProtocol {

    // MARK: - Public API

    func routeToLegalDoc() {
        navigateTo(
            LegalDocumentationRoute(isPresented: isNavigating)
        )
    }
}
