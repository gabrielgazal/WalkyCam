import SwiftUI

final class LidarOnboardingAssembler: LidarOnboardingAssemblerProtocol {
    func resolveView(
        route: LidarOnboardingRoute
    ) -> LidarOnboardingView<LidarOnboardingViewModel, LidarOnboardingRouter> {

        let router = LidarOnboardingRouter(isPresented: route.isPresented)

        let interactor = LidarOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = LidarOnboardingViewModel(interactor: interactor)
        let view = LidarOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
