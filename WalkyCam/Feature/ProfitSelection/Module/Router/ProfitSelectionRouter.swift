import SwiftUI

final class ProfitSelectionRouter: Router, ProfitSelectionRouterProtocol {

    // MARK: - Public API

    func routeToIdentityUpload(data: CamerRegistrationData) {
        navigateTo(
            IdentityUploadRoute(isPresented: isNavigating, data: data)
        )
    }
}

