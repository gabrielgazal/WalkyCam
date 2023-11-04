import SwiftUI

final class CashWalletOnboardingViewModel: CashWalletOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CashWalletOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: CashWalletOnboardingInteractorProtocol = CashWalletOnboardingInteractor()) {
        self.interactor = interactor
    }
}
