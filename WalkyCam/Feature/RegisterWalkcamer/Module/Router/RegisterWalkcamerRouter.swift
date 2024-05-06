import SwiftUI

final class RegisterWalkcamerRouter: Router, RegisterWalkcamerRouterProtocol {

    // MARK: - Public API

    func routeToProfit(registrationData: CamerRegistrationData) {
        navigateTo(
            ProfitSelectionRoute(isPresented: isNavigating,
                                 registrationData: registrationData)
        )
    }
}
