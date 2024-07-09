import SwiftUI

protocol AddPeopleTransmissionRouterProtocol: Router {
    func routeToServiceDetails(
        currentStep: Int,
        totalSteps: Int,
        onCancelAction: (() -> Void)?)
}

