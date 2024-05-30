import SwiftUI
import Networking

final class ARHandsOnboardingAssembler: ARHandsOnboardingAssemblerProtocol {
    func resolveView(
        route: ARHandsOnboardingRoute
    ) -> ARHandsOnboardingView<ARHandsOnboardingViewModel, ARHandsOnboardingRouter> {

        let router = ARHandsOnboardingRouter(isPresented: route.isPresented)
        
        let repository = route.retailRepository.resolve(ConfigurationRepositoryProtocol.self)

        let interactor = ARHandsOnboardingInteractor(
            useCases: .init(
                updateARHandsConfiguration: .updateARHands(repository: repository)
            )
        )
        let viewModel = ARHandsOnboardingViewModel(interactor: interactor)
        let view = ARHandsOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
