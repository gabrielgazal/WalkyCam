import SwiftUI

final class FunctionMenuViewModel: FunctionMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FunctionMenuInteractorProtocol
    @Published var model: FunctionMenuModel

    // MARK: - Initialization

    init(interactor: FunctionMenuInteractorProtocol = FunctionMenuInteractor(),
         model: FunctionMenuModel) {
        self.interactor = interactor
        self.model = model
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
