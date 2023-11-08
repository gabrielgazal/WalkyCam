import SwiftUI

final class CashTabViewModel: CashTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CashTabInteractorProtocol
    @Published var activities: [WalletActivityModel] = []

    // MARK: - Initialization

    init(interactor: CashTabInteractorProtocol = CashTabInteractor()) {
        self.interactor = interactor
        initializeActivities()
    }

    // MARK: - Private Methods

    private func initializeActivities() {
        activities = [
            .init(date: Date(), title: "Thiago Guirao", description: "Street Cam 2h", value: 82.00, isValuePositive: true),
            .init(date: Date(), title: "Thiago Guirao", description: "Street Cam 2h", value: 13.00, isValuePositive: false),
            .init(date: Date(), title: "Thiago Guirao", description: "Street Cam 2h", value: 82.00, isValuePositive: true)
        ]
    }
}
