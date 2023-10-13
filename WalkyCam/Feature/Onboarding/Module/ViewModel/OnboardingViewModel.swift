import SwiftUI

final class OnboardingViewModel: OnboardingViewModelProtocol {

    // MARK: - Dependencies

    @Published var currentPage: Int = 0

    // MARK: - Initialization

    init() {}
}
