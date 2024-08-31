import SwiftUI

final class ThermalCameraOnboardingAssembler: ThermalCameraOnboardingAssemblerProtocol {
    func resolveView(
        route: ThermalCameraOnboardingRoute
    ) -> ThermalCameraOnboardingView<ThermalCameraOnboardingViewModel, ThermalCameraOnboardingRouter> {

        let router = ThermalCameraOnboardingRouter(isPresented: route.isPresented)

        let interactor = ThermalCameraOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = ThermalCameraOnboardingViewModel(interactor: interactor)
        let view = ThermalCameraOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
