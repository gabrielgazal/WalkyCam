import SwiftUI

final class RuralDroneOnboardingViewModel: RuralDroneOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RuralDroneOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto todas las condiciones. Leer AQUÍ")

    // MARK: - Initialization

    init(interactor: RuralDroneOnboardingInteractorProtocol = RuralDroneOnboardingInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func updateUserConfiguration(completion: (() -> Void)?) async {}
}
