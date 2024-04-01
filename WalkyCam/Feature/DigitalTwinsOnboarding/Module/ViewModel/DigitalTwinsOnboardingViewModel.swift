import SwiftUI

final class DigitalTwinsOnboardingViewModel: DigitalTwinsOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: DigitalTwinsOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: DigitalTwinsOnboardingInteractorProtocol = DigitalTwinsOnboardingInteractor()) {
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
