import SwiftUI

final class WalkyBotViewModel: WalkyBotViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyBotInteractorProtocol
    @Published var message: String = ""
    
    // MARK: - Initialization

    init(interactor: WalkyBotInteractorProtocol = WalkyBotInteractor()) {
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
