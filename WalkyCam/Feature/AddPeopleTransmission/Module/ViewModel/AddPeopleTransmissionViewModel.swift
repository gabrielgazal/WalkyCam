import SwiftUI

final class AddPeopleTransmissionViewModel: AddPeopleTransmissionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AddPeopleTransmissionInteractorProtocol

    // MARK: - Initialization

    init(interactor: AddPeopleTransmissionInteractorProtocol = AddPeopleTransmissionInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

    #warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
