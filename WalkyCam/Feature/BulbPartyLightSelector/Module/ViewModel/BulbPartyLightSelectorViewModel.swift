import SwiftUI

final class BulbPartyLightSelectorViewModel: BulbPartyLightSelectorViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: BulbPartyLightSelectorInteractorProtocol

    // MARK: - Initialization

    init(interactor: BulbPartyLightSelectorInteractorProtocol = BulbPartyLightSelectorInteractor()) {
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
