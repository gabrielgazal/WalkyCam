import SwiftUI

final class ARHandsMenuViewModel: ARHandsMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ARHandsMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: ARHandsMenuInteractorProtocol = ARHandsMenuInteractor()) {
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
