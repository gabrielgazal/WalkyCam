import SwiftUI
import Networking

final class WalkyCamerOnboardingAssembler: WalkyCamerOnboardingAssemblerProtocol {
    func resolveView(
        route: WalkyCamerOnboardingRoute
    ) -> WalkyCamerOnboardingView<WalkyCamerOnboardingViewModel, WalkyCamerOnboardingRouter> {

        let router = WalkyCamerOnboardingRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(ConfigurationRepositoryProtocol.self)

        let interactor = WalkyCamerOnboardingInteractor(
            useCases: .init(
                updateStreetcamConfiguration: .updateStreetCam(repository: repository)
            )
        )
        let viewModel = WalkyCamerOnboardingViewModel(interactor: interactor)
        let view = WalkyCamerOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
