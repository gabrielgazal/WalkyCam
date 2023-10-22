import SwiftUI

final class ComparePlansViewModel: ComparePlansViewModelProtocol {

    // MARK: - Dependencies

    @Published var currentPage: Int = 0
    @Published var availablePlans: [AvailablePlanData] = []
    private let interactor: ComparePlansInteractorProtocol

    // MARK: - Initialization

    init(interactor: ComparePlansInteractorProtocol = ComparePlansInteractor()) {
        self.interactor = interactor
        fetchAvailablePlans()
    }

    // MARK: - Private Methods

    private func fetchAvailablePlans() {
        availablePlans = [
            .init(name: "Free", value: "0", color: Color.plateado),
            .init(name: "Basic", value: "30", color: Color.acentoFondoDark),
            .init(name: "Standard", value: "60", color: Color.naranja),
            .init(name: "Premium", value: "180", color: Color.premium)
        ]
    }
}
