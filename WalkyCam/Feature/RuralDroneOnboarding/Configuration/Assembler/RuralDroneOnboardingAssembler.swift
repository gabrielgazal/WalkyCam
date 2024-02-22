import SwiftUI

final class RuralDroneOnboardingAssembler: RuralDroneOnboardingAssemblerProtocol {
    func resolveView(
        route: RuralDroneOnboardingRoute
    ) -> RuralDroneOnboardingView<RuralDroneOnboardingViewModel, RuralDroneOnboardingRouter> {

        let router = RuralDroneOnboardingRouter(isPresented: route.isPresented)

        let interactor = RuralDroneOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = RuralDroneOnboardingViewModel(interactor: interactor)
        let view = RuralDroneOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
