import SwiftUI

final class Scan3DOnboardingViewModel: Scan3DOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: Scan3DOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: Scan3DOnboardingInteractorProtocol = Scan3DOnboardingInteractor()) {
        self.interactor = interactor
    }
}
