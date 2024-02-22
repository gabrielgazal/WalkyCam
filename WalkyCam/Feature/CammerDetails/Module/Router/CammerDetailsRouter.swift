import SwiftUI

final class CammerDetailsRouter: Router, CammerDetailsRouterProtocol {

    // MARK: - Public API

    func routeToAddPeople(specialistMode: Bool) {
        navigateTo(
            specialistMode ? SpecialistNotifiedRoute(isPresented: isNavigating) : AddPeopleTransmissionRoute(isPresented: isNavigating)
        )
    }
}

