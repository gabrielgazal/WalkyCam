import SwiftUI

protocol DigitalTwinsOnboardingAssemblerProtocol {
    func resolveView(
        route: DigitalTwinsOnboardingRoute
    ) -> DigitalTwinsOnboardingView<DigitalTwinsOnboardingViewModel, DigitalTwinsOnboardingRouter>
}