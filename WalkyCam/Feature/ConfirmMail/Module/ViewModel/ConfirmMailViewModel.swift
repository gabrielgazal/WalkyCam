import SwiftUI

final class ConfirmMailViewModel: ConfirmMailViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ConfirmMailInteractorProtocol

    // MARK: - Initialization

    init(interactor: ConfirmMailInteractorProtocol = ConfirmMailInteractor()) {
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
