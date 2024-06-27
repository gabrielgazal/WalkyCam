import SwiftUI

final class PlayBusinessViewModel: PlayBusinessViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PlayBusinessInteractorProtocol

    // MARK: - Initialization

    init(interactor: PlayBusinessInteractorProtocol = PlayBusinessInteractor()) {
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
