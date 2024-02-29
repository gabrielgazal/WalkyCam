import SwiftUI

protocol _DPrintOnboardingAssemblerProtocol {
    func resolveView(
        route: _DPrintOnboardingRoute
    ) -> _DPrintOnboardingView<_DPrintOnboardingViewModel, _DPrintOnboardingRouter>
}