import SwiftUI

final class WalkyCamerOnboardingViewModel: WalkyCamerOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyCamerOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: WalkyCamerOnboardingInteractorProtocol) {
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
