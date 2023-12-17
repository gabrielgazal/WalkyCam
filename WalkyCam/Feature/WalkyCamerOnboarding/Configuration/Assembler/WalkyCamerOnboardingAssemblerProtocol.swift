import SwiftUI

protocol WalkyCamerOnboardingAssemblerProtocol {
    func resolveView(
        route: WalkyCamerOnboardingRoute
    ) -> WalkyCamerOnboardingView<WalkyCamerOnboardingViewModel, WalkyCamerOnboardingRouter>
}