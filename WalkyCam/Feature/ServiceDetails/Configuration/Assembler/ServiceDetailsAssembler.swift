import SwiftUI
import Networking

final class ServiceDetailsAssembler: ServiceDetailsAssemblerProtocol {
    func resolveView(
        route: ServiceDetailsRoute
    ) -> ServiceDetailsView<ServiceDetailsViewModel, ServiceDetailsRouter> {
        
        let router = ServiceDetailsRouter(state: RouterState(isPresented: route.isPresented))
        
        let repository = route.retailRepository.resolve(VideoCallRepositoryProtocol.self)
        
        let interactor = ServiceDetailsInteractor(
            useCases: .init(
                updateVideoCall: .updateVideoCall(repository: repository),
                cancelVideoCall: .cancelVideoCall(repository: repository)
            )
        )
        let viewModel = ServiceDetailsViewModel(interactor: interactor,
                                                currentStep: route.currentStep,
                                                totalSteps: route.totalSteps,
                                                onCancelAction: route.onCancelAction)
        let view = ServiceDetailsView(viewModel: viewModel, router: router)
        
        return view
    }
}
