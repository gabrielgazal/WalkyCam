import SwiftUI

final class AddPeopleTransmissionRouter: Router, AddPeopleTransmissionRouterProtocol {

    // MARK: - Public API

    func routeToServiceDetails(
        currentStep: Int,
        totalSteps: Int,
        onCancelAction: (() -> Void)?
    ) {
        navigateTo(
            ServiceDetailsRoute(isPresented: isNavigating,
                                currentStep: currentStep,
                                totalSteps: totalSteps,
                                onCancelAction: onCancelAction)
        )
    }
}

