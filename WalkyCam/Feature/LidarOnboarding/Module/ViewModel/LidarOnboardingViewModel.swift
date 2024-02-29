import SwiftUI

final class LidarOnboardingViewModel: LidarOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: LidarOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto todas las condiciones. Leer AQUÍ")

    // MARK: - Initialization

    init(interactor: LidarOnboardingInteractorProtocol = LidarOnboardingInteractor()) {
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
