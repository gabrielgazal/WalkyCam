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
            .init(title: "PI Network", currentValue: 27.45, variation: -0.16, graph: Asset.Miscelaneous.piGraph.name),
            .init(title: "RECAMER Coin", currentValue: 0.032, variation: 0.24, graph: Asset.Miscelaneous.recamerGraph.name)
        ]
    }

    private func initializeActivities() {
        activities = [
            .init(date: Date(), title: "Ganancia Crypto PI", description: "Drone", value: 0.000017),
            .init(date: Date(), title: "Ganancia Crypto PI", description: "IOT", value: -0.000017),
            .init(date: Date(), title: "Ganancia Crypto PI", description: "Street Cam", value: 0.000017)
        ]
    }
}
