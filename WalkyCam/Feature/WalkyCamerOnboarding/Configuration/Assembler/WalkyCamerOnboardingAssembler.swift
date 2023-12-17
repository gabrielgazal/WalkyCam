import SwiftUI

final class WalkyCamerOnboardingAssembler: WalkyCamerOnboardingAssemblerProtocol {
    func resolveView(
        route: WalkyCamerOnboardingRoute
    ) -> WalkyCamerOnboardingView<WalkyCamerOnboardingViewModel, WalkyCamerOnboardingRouter> {

        let router = WalkyCamerOnboardingRouter(isPresented: route.isPresented)

        let interactor = WalkyCamerOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = WalkyCamerOnboardingViewModel(interactor: interactor)
        let view = WalkyCamerOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
