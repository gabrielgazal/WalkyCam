import SwiftUI

final class RegistrationPlansViewModel: RegistrationPlansViewModelProtocol {

    // MARK: - Dependencies

    @Published var availablePlans: [AvailablePlanData] = []
    private let interactor: RegistrationPlansInteractorProtocol

    // MARK: - Initialization

    init(interactor: RegistrationPlansInteractorProtocol = RegistrationPlansInteractor()) {
        self.interactor = interactor
        fetchAvailablePlans()
    }


    private func fetchAvailablePlans() {
        availablePlans = [
            .init(name: "Free", value: "0", color: Color(red: 0.71, green: 0.71, blue: 0.71, opacity: 0.4)),
            .init(name: "Basic", value: "30", color: Color(red: 0.46, green: 0.21, blue: 0.6, opacity: 0.4)),
            .init(name: "Standard", value: "60", color: Color(red: 0.91, green: 0.36, blue: 0.05, opacity: 0.4)),
            .init(name: "Premium", value: "180", color: Color(red: 0.95, green: 0.79, blue: 0.3))
        ]
    }
}
