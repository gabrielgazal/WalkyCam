import SwiftUI

final class Scan3DMenuViewModel: Scan3DMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: Scan3DMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: Scan3DMenuInteractorProtocol = Scan3DMenuInteractor()) {
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
