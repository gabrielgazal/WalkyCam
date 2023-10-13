import SwiftUI

final class OnboardingAssembler: OnboardingAssemblerProtocol {
    func resolveView(
        route: OnboardingRoute
    ) -> OnboardingView<OnboardingViewModel, OnboardingRouter> {

        let router = OnboardingRouter(isPresented: route.isPresented)

        let interactor = OnboardingInteractor(
            useCases: .init()
        )
        let viewModel = OnboardingViewModel(interactor: interactor)
        let view = OnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
