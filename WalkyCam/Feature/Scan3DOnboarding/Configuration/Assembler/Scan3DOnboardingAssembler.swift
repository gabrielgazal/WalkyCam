import SwiftUI

final class Scan3DOnboardingAssembler: Scan3DOnboardingAssemblerProtocol {
    func resolveView(
        route: Scan3DOnboardingRoute
    ) -> Scan3DOnboardingView<Scan3DOnboardingViewModel, Scan3DOnboardingRouter> {

        let router = Scan3DOnboardingRouter(isPresented: route.isPresented)

        let interactor = Scan3DOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = Scan3DOnboardingViewModel(interactor: interactor)
        let view = Scan3DOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
