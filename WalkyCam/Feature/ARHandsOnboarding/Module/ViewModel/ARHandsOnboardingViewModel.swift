import SwiftUI

final class ARHandsOnboardingViewModel: ARHandsOnboardingViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: ARHandsOnboardingInteractorProtocol
    @Published var isUpdating: Bool = false

    // MARK: - Initialization
    
    init(interactor: ARHandsOnboardingInteractorProtocol) {
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
