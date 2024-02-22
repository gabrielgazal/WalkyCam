import SwiftUI

protocol Scan3DOnboardingAssemblerProtocol {
    func resolveView(
        route: Scan3DOnboardingRoute
    ) -> Scan3DOnboardingView<Scan3DOnboardingViewModel, Scan3DOnboardingRouter>
}