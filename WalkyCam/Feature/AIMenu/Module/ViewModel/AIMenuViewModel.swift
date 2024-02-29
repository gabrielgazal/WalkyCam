import SwiftUI

final class AIMenuViewModel: AIMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AIMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: AIMenuInteractorProtocol = AIMenuInteractor()) {
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
