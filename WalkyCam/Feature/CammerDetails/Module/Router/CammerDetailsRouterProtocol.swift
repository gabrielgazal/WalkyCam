import SwiftUI

protocol CammerDetailsRouterProtocol: Router {
    func routeToAddPeople(specialistMode: Bool, currentStep: Int, totalSteps: Int)
}

