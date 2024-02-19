import SwiftUI

final class ARHandsOnboardingViewModel: ARHandsOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ARHandsOnboardingInteractorProtocol

    // MARK: - Initialization

    init(interactor: ARHandsOnboardingInteractorProtocol = ARHandsOnboardingInteractor()) {
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
