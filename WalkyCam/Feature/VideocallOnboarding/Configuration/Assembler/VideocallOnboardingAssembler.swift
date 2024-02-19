import SwiftUI
import Networking

final class VideocallOnboardingAssembler: VideocallOnboardingAssemblerProtocol {
    func resolveView(
        route: VideocallOnboardingRoute
    ) -> VideocallOnboardingView<VideocallOnboardingViewModel, VideocallOnboardingRouter> {

        let router = VideocallOnboardingRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(ConfigurationRepositoryProtocol.self)

        let interactor = VideocallOnboardingInteractor(
            useCases: .init(
                updateStreetcamConfiguration: .updateStreetCam(repository: repository)
            )
        )
        let viewModel = VideocallOnboardingViewModel(interactor: interactor)
        let view = VideocallOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
