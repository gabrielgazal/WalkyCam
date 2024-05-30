import SwiftUI
import Networking

final class Scan3DOnboardingAssembler: Scan3DOnboardingAssemblerProtocol {
    func resolveView(
        route: Scan3DOnboardingRoute
    ) -> Scan3DOnboardingView<Scan3DOnboardingViewModel, Scan3DOnboardingRouter> {

        let router = Scan3DOnboardingRouter(isPresented: route.isPresented)
        
        let repository = route.retailRepository.resolve(ConfigurationRepositoryProtocol.self)

        let interactor = Scan3DOnboardingInteractor(
            useCases: .init(
                updateScan3DConfiguration: .updateScan3D(repository: repository)
            )
        )
        let viewModel = Scan3DOnboardingViewModel(interactor: interactor)
        let view = Scan3DOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
