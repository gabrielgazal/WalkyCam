import SwiftUI

final class DigitalTwinsOnboardingAssembler: DigitalTwinsOnboardingAssemblerProtocol {
    func resolveView(
        route: DigitalTwinsOnboardingRoute
    ) -> DigitalTwinsOnboardingView<DigitalTwinsOnboardingViewModel, DigitalTwinsOnboardingRouter> {

        let router = DigitalTwinsOnboardingRouter(isPresented: route.isPresented)

        let interactor = DigitalTwinsOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = DigitalTwinsOnboardingViewModel(interactor: interactor)
        let view = DigitalTwinsOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
