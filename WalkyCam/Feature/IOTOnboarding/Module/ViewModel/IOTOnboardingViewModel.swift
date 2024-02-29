import SwiftUI

final class IOTOnboardingViewModel: IOTOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: IOTOnboardingInteractorProtocol

    // MARK: - Initialization

    init(interactor: IOTOnboardingInteractorProtocol = IOTOnboardingInteractor()) {
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
