import SwiftUI

final class PrintConfirmationViewModel: PrintConfirmationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PrintConfirmationInteractorProtocol

    // MARK: - Initialization

    init(interactor: PrintConfirmationInteractorProtocol = PrintConfirmationInteractor()) {
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
