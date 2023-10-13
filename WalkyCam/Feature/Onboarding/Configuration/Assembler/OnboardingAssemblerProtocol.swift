import SwiftUI

protocol OnboardingAssemblerProtocol {
    func resolveView(
        route: OnboardingRoute
    ) -> OnboardingView<OnboardingViewModel, OnboardingRouter>
}