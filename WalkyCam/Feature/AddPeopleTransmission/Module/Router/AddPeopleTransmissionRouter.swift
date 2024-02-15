import SwiftUI

final class AddPeopleTransmissionRouter: Router, AddPeopleTransmissionRouterProtocol {

    // MARK: - Public API

    func routeToServiceDetails(onCancelAction: (() -> Void)?) {
        navigateTo(
            ServiceDetailsRoute(isPresented: isNavigating,
                                onCancelAction: onCancelAction)
        )
    }
}

