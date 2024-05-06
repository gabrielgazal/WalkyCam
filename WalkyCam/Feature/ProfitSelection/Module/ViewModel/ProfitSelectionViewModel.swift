import SwiftUI

final class ProfitSelectionViewModel: ProfitSelectionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ProfitSelectionInteractorProtocol
    @State var registrationData: CamerRegistrationData
    
    // MARK: - Initialization

    init(interactor: ProfitSelectionInteractorProtocol = ProfitSelectionInteractor(),
         registrationData: CamerRegistrationData) {
        self.interactor = interactor
        self.registrationData = registrationData
    }

    // MARK: - Public API

    func someAction() {

    }

    // MARK: - Private Methods

    private func somePrivateMethod() {

    }
}
