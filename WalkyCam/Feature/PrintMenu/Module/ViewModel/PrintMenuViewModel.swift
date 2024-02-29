import SwiftUI

final class PrintMenuViewModel: PrintMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PrintMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: PrintMenuInteractorProtocol = PrintMenuInteractor()) {
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
