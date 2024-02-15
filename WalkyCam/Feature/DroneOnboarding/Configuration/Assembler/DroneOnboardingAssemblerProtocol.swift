import SwiftUI

protocol DroneOnboardingAssemblerProtocol {
    func resolveView(
        route: DroneOnboardingRoute
    ) -> DroneOnboardingView<DroneOnboardingViewModel, DroneOnboardingRouter>
}