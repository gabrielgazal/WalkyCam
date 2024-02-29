import SwiftUI

protocol LidarOnboardingAssemblerProtocol {
    func resolveView(
        route: LidarOnboardingRoute
    ) -> LidarOnboardingView<LidarOnboardingViewModel, LidarOnboardingRouter>
}