import SwiftUI

protocol RuralDroneOnboardingAssemblerProtocol {
    func resolveView(
        route: RuralDroneOnboardingRoute
    ) -> RuralDroneOnboardingView<RuralDroneOnboardingViewModel, RuralDroneOnboardingRouter>
}
