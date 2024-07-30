import SwiftUI
import Networking

final class ServiceConfirmationAssembler: ServiceConfirmationAssemblerProtocol {
    func resolveView(
        route: ServiceConfirmationRoute
    ) -> ServiceConfirmationView<ServiceConfirmationViewModel, ServiceConfirmationRouter> {

        let router = ServiceConfirmationRouter(state: RouterState(isPresented: route.isPresented))

        let repository = route.retailRepository.resolve(VideoCallRepositoryProtocol.self)
            
        let interactor = ServiceConfirmationInteractor(
            useCases: .init(
                saveVideoCall: .scheduleVideoCall(repository: repository),
                cancelVideoCall: .cancelVideoCall(repository: repository)
            )
        )
        let viewModel = ServiceConfirmationViewModel(interactor: interactor)
        let view = ServiceConfirmationView(viewModel: viewModel, router: router)

        return view
    }
}
