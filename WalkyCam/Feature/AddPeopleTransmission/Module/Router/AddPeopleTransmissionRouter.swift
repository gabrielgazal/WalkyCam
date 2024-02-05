import SwiftUI

final class AddPeopleTransmissionRouter: Router, AddPeopleTransmissionRouterProtocol {

    // MARK: - Public API

    func routeToServiceDetails() {
        navigateTo(
            ServiceDetailsRoute(isPresented: isNavigating)
        )
    }
}

