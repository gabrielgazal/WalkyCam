import SwiftUI

final class AIOnboardingViewModel: AIOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AIOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: AIOnboardingInteractorProtocol = AIOnboardingInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func someAction() {

    }

    // MARK: - Private Methods

    private func somePrivateMethod() {

    }
}
