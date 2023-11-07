import SwiftUI

final class CashTabViewModel: CashTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CashTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: CashTabInteractorProtocol = CashTabInteractor()) {
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
