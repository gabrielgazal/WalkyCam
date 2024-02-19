import SwiftUI

protocol VideocallOnboardingAssemblerProtocol {
    func resolveView(
        route: VideocallOnboardingRoute
    ) -> VideocallOnboardingView<VideocallOnboardingViewModel, VideocallOnboardingRouter>
}
