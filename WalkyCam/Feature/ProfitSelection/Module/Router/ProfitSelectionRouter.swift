import SwiftUI

final class ProfitSelectionRouter: Router, ProfitSelectionRouterProtocol {

    // MARK: - Public API

    func routeToIdentityUpload(data: CamerRegistrationData) {
        navigateTo(
            TimedLoadingScreenRoute(
                isPresented: isNavigating,
                title: "Ya casi eres WalkCamer",
                description: "Solo unos pasos mas",
                time: 3.0,
                destinationRoute: IdentityUploadRoute(isPresented: isNavigating, data: data)
            )
        )
    }
}

