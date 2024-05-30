import SwiftUI

final class Scan3DOnboardingViewModel: Scan3DOnboardingViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: Scan3DOnboardingInteractorProtocol
    @Published var currentPage: Int = 0
    @Published var isUpdating: Bool = false
    
    // MARK: - Initialization
    
    init(interactor: Scan3DOnboardingInteractorProtocol) {
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
