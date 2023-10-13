import SwiftUI

final class OnboardingViewModel: OnboardingViewModelProtocol {

    // MARK: - Dependencies

    @Published var currentPage: Int = 0

    private let interactor: OnboardingInteractorProtocol

    // MARK: - Initialization

    init(interactor: OnboardingInteractorProtocol = OnboardingInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }
}
