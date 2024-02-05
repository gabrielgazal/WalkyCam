import SwiftUI

final class CammerDetailsRouter: Router, CammerDetailsRouterProtocol {

    // MARK: - Public API

    func routeToAddPeople() {
        navigateTo(
            AddPeopleTransmissionRoute(isPresented: isNavigating)
        )
    }
}

