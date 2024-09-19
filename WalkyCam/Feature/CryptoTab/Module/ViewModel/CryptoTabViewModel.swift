import SwiftUI

final class CryptoTabViewModel: CryptoTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CryptoTabInteractorProtocol
    @Published var activities: [WalletActivityModel] = []
    @Published var cryptoActivities: [CryptoActivityModel] = []

    // MARK: - Initialization

    init(interactor: CryptoTabInteractorProtocol = CryptoTabInteractor()) {
        self.interactor = interactor
        initializeCryptoActivities()
        initializeActivities()
    }

    // MARK: - Private Methods

    private func initializeCryptoActivities() {
        cryptoActivities = [
            .init(title: L10n.CryptoTabViewModel.piNetwork,
                  currentValue: 27.45,
                  variation: -0.16,
                  graph: Asset.Miscelaneous.piGraph.name,
                  balance: 168,
                  type: .pi),
            .init(title: L10n.CryptoTabViewModel.recamerCoin,
                  currentValue: 0.032,
                  variation: 0.24,
                  graph: Asset.Miscelaneous.recamerGraph.name,
                  balance: 200,
                  type: .rc2)
        ]
    }

    private func initializeActivities() {
        activities = [
            .init(date: Date(), title: L10n.CryptoTabViewModel.cryptoGainPi, description: L10n.CryptoTabViewModel.drone, value: 0.000017),
            .init(date: Date(), title: L10n.CryptoTabViewModel.cryptoGainPi, description: L10n.CryptoTabViewModel.iot, value: -0.000017),
            .init(date: Date(), title: L10n.CryptoTabViewModel.cryptoGainPi, description: L10n.CryptoTabViewModel.streetCam, value: 0.000017)
        ]
    }
}
