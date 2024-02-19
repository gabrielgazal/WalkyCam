import SwiftUI

final class ARHandsOnboardingAssembler: ARHandsOnboardingAssemblerProtocol {
    func resolveView(
        route: ARHandsOnboardingRoute
    ) -> ARHandsOnboardingView<ARHandsOnboardingViewModel, ARHandsOnboardingRouter> {

        let router = ARHandsOnboardingRouter(isPresented: route.isPresented)

        let interactor = ARHandsOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = ARHandsOnboardingViewModel(interactor: interactor)
        let view = ARHandsOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
