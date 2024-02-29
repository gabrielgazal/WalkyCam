import SwiftUI

final class AIOnboardingAssembler: AIOnboardingAssemblerProtocol {
    func resolveView(
        route: AIOnboardingRoute
    ) -> AIOnboardingView<AIOnboardingViewModel, AIOnboardingRouter> {

        let router = AIOnboardingRouter(isPresented: route.isPresented)

        let interactor = AIOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = AIOnboardingViewModel(interactor: interactor)
        let view = AIOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
