import SwiftUI

final class PlansPagesViewModel: PlansPagesViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PlansPagesInteractorProtocol
    @Published var currentPage: Int
    @Published var plans: [PlansPagesModel] = []

    // MARK: - Initialization

    init(
        interactor: PlansPagesInteractorProtocol = PlansPagesInteractor(),
        currentPage: Int
    ) {
        self.interactor = interactor
        self.currentPage = currentPage
        initializePlans()
    }

    private func initializePlans() {
        plans = [
            .init(title: "Free", monthlyPrice: 0.0, backgroundImage: Asset.Fondos.planFondo.name, accentColor: .plateado, features: []),
            .init(title: "Basic", monthlyPrice: 30.0, backgroundImage: Asset.Fondos.planFondo.name, accentColor: .acentoFondoDark, features: []),
            .init(title: "Standard", monthlyPrice: 60.0, backgroundImage: Asset.Fondos.planFondo.name, accentColor: .naranja, features: []),
            .init(title: "Premium", monthlyPrice: 180.0, backgroundImage: Asset.Fondos.planFondo.name, accentColor: .premium, features: [])
        ]
    }
}
