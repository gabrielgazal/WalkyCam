import SwiftUI

final class CryptoDetailsViewModel: CryptoDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CryptoDetailsInteractorProtocol
    @Published var cryptoData: CryptoActivityModel

    // MARK: - Initialization

    init(interactor: CryptoDetailsInteractorProtocol = CryptoDetailsInteractor(),
         cryptoData: CryptoActivityModel) {
        self.interactor = interactor
        self.cryptoData = cryptoData
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
