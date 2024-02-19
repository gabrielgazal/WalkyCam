import SwiftUI

final class VideocallOnboardingViewModel: VideocallOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideocallOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: VideocallOnboardingInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

   @MainActor func updateUserConfiguration(completion: (() -> Void)?) async {
       do {
           _ = try await interactor.updateUserConfiguration()
       } catch {}
       completion?()
    }
}
