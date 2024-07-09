import SwiftUI

final class ServiceDetailsAssembler: ServiceDetailsAssemblerProtocol {
    func resolveView(
        route: ServiceDetailsRoute
    ) -> ServiceDetailsView<ServiceDetailsViewModel, ServiceDetailsRouter> {
        
        let router = ServiceDetailsRouter(state: RouterState(isPresented: route.isPresented))
        
        let interactor = ServiceDetailsInteractor(
            useCases: .init()
        )
        let viewModel = ServiceDetailsViewModel(interactor: interactor,
                                                currentStep: route.currentStep,
                                                totalSteps: route.totalSteps,
                                                onCancelAction: route.onCancelAction)
        let view = ServiceDetailsView(viewModel: viewModel, router: router)
        
        return view
    }
}
