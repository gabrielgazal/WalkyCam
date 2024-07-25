import SwiftUI

final class ServiceConfirmationViewModel: ServiceConfirmationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceConfirmationInteractorProtocol

    // MARK: - Initialization

    init(interactor: ServiceConfirmationInteractorProtocol = ServiceConfirmationInteractor()) {
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
