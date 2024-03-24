import SwiftUI

final class VideocallOnboardingViewModel: VideocallOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideocallOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var isUpdating: Bool = false

    // MARK: - Initialization

    init(interactor: VideocallOnboardingInteractorProtocol) {
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
