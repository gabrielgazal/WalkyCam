import SwiftUI

final class StartupViewModel: StartupViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: StartupInteractorProtocol

    // MARK: - Initialization

    init(interactor: StartupInteractorProtocol = StartupInteractor()) {
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
