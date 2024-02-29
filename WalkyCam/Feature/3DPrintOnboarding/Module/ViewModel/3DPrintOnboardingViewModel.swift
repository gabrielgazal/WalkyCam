import SwiftUI

final class _DPrintOnboardingViewModel: _DPrintOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: _DPrintOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: _DPrintOnboardingInteractorProtocol = _DPrintOnboardingInteractor()) {
        self.interactor = interactor
    }
}
