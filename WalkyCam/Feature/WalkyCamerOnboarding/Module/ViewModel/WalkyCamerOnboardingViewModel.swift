import SwiftUI

final class WalkyCamerOnboardingViewModel: WalkyCamerOnboardingViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyCamerOnboardingInteractorProtocol
    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init(interactor: WalkyCamerOnboardingInteractorProtocol = WalkyCamerOnboardingInteractor()) {
        self.interactor = interactor
    }
}
