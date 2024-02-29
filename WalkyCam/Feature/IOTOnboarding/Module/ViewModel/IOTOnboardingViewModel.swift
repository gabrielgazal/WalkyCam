import SwiftUI

final class IOTOnboardingViewModel: IOTOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: IOTOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    
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
