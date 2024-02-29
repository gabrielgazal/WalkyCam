import SwiftUI

protocol AIOnboardingAssemblerProtocol {
    func resolveView(
        route: AIOnboardingRoute
    ) -> AIOnboardingView<AIOnboardingViewModel, AIOnboardingRouter>
}