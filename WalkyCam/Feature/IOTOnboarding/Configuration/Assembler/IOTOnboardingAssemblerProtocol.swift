import SwiftUI

protocol IOTOnboardingAssemblerProtocol {
    func resolveView(
        route: IOTOnboardingRoute
    ) -> IOTOnboardingView<IOTOnboardingViewModel, IOTOnboardingRouter>
}