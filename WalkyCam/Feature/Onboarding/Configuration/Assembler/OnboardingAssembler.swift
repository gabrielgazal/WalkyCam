import SwiftUI

final class OnboardingAssembler: OnboardingAssemblerProtocol {
    func resolveView(
        route: OnboardingRoute
    ) -> OnboardingView<OnboardingViewModel, OnboardingRouter> {

        let router = OnboardingRouter(isPresented: route.isPresented)

        let viewModel = OnboardingViewModel()
        let view = OnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
