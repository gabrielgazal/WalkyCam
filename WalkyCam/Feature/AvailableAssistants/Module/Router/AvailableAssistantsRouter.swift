import SwiftUI

final class AvailableAssistantsRouter: Router, AvailableAssistantsRouterProtocol {

    // MARK: - Public API

    func routeToCamerDetail(_ data: CammerData) {
        navigateTo(
            CammerDetailsRoute(isPresented: isNavigating, cammerData: data, specialistMode: true)
        )
    }
}

