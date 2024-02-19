import SwiftUI

final class DroneOnboardingViewModel: DroneOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: DroneOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto todas las condiciones. Leer AQUÍ")

    // MARK: - Initialization

    init(interactor: DroneOnboardingInteractorProtocol = DroneOnboardingInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func updateUserConfiguration(completion: (() -> Void)?) async {}
}
