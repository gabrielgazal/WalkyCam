import SwiftUI

final class IOTOnboardingAssembler: IOTOnboardingAssemblerProtocol {
    func resolveView(
        route: IOTOnboardingRoute
    ) -> IOTOnboardingView<IOTOnboardingViewModel, IOTOnboardingRouter> {

        let router = IOTOnboardingRouter(isPresented: route.isPresented)

        let interactor = IOTOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = IOTOnboardingViewModel(interactor: interactor)
        let view = IOTOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
