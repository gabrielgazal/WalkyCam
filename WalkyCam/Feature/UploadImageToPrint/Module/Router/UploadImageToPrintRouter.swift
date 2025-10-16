import SwiftUI

final class UploadImageToPrintRouter: Router, UploadImageToPrintRouterProtocol {

    // MARK: - Public API

    func routeToPrintConfirmation() {
        navigateTo(
            PrintConfirmationRoute(isPresented: isNavigating)
        )
    }
}

