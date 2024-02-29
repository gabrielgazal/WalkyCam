import SwiftUI

final class IOTMenuViewModel: IOTMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: IOTMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: IOTMenuInteractorProtocol = IOTMenuInteractor()) {
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
