import SwiftUI

final class CammerDetailsRouter: Router, CammerDetailsRouterProtocol {

    // MARK: - Public API

    func routeToAddPeople(specialistMode: Bool, currentStep: Int, totalSteps: Int) {
        navigateTo(
            specialistMode ? SpecialistNotifiedRoute(isPresented: isNavigating) : AddPeopleTransmissionRoute(
                isPresented: isNavigating,
                currentStep: currentStep,
                totalSteps: totalSteps
            )
        )
    }
}

