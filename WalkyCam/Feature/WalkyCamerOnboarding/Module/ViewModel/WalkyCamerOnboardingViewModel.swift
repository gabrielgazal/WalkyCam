import SwiftUI

final class WalkyCamerOnboardingViewModel: WalkyCamerOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyCamerOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var isUpdating: Bool = false

    // MARK: - Initialization

    init(interactor: WalkyCamerOnboardingInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

   @MainActor func updateUserConfiguration(completion: (() -> Void)?) async {
       isUpdating = true
       do {
           _ = try await interactor.updateUserConfiguration()
           isUpdating = false
       } catch {
           isUpdating = false
       }
       completion?()
    }
}
