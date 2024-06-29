import SwiftUI

final class GamesViewModel: GamesViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: GamesInteractorProtocol

    // MARK: - Initialization

    init(interactor: GamesInteractorProtocol = GamesInteractor()) {
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
