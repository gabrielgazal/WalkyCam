import SwiftUI

final class DroneOnboardingAssembler: DroneOnboardingAssemblerProtocol {
    func resolveView(
        route: DroneOnboardingRoute
    ) -> DroneOnboardingView<DroneOnboardingViewModel, DroneOnboardingRouter> {

        let router = DroneOnboardingRouter(isPresented: route.isPresented)

        let interactor = DroneOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = DroneOnboardingViewModel(interactor: interactor)
        let view = DroneOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
