import SwiftUI

final class AddPeopleTransmissionViewModel: AddPeopleTransmissionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AddPeopleTransmissionInteractorProtocol
    @Published var currentStep: Int
    @Published var totalSteps: Int
    
    // MARK: - Initialization

    init(interactor: AddPeopleTransmissionInteractorProtocol = AddPeopleTransmissionInteractor(),
         currentStep: Int,
         totalSteps: Int) {
        self.interactor = interactor
        self.currentStep = currentStep
        self.totalSteps = totalSteps
    }
}
