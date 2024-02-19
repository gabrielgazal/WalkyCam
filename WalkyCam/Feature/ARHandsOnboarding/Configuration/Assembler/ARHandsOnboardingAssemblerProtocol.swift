import SwiftUI

protocol ARHandsOnboardingAssemblerProtocol {
    func resolveView(
        route: ARHandsOnboardingRoute
    ) -> ARHandsOnboardingView<ARHandsOnboardingViewModel, ARHandsOnboardingRouter>
}