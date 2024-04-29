import SwiftUI

final class RegisterWalkcamerViewModel: RegisterWalkcamerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RegisterWalkcamerInteractorProtocol

    // MARK: - Initialization

    init(interactor: RegisterWalkcamerInteractorProtocol = RegisterWalkcamerInteractor()) {
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
