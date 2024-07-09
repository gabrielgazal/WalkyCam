import SwiftUI

final class ScheduleVideoCallRouter: Router, ScheduleVideoCallRouterProtocol {

    // MARK: - Public API

    func routeToAddPeople() {
        navigateTo(
            AddPeopleTransmissionRoute(isPresented: isNavigating,
                                       currentStep: 2, totalSteps: 3)
        )
    }
}

