import SwiftUI

protocol ThermalCameraOnboardingAssemblerProtocol {
    func resolveView(
        route: ThermalCameraOnboardingRoute
    ) -> ThermalCameraOnboardingView<ThermalCameraOnboardingViewModel, ThermalCameraOnboardingRouter>
}