import SwiftUI

final class ServiceDetailsAssembler: ServiceDetailsAssemblerProtocol {
    func resolveView(
        route: ServiceDetailsRoute
    ) -> ServiceDetailsView<ServiceDetailsViewModel, ServiceDetailsRouter> {

        let router = ServiceDetailsRouter(isPresented: route.isPresented)

        let interactor = ServiceDetailsInteractor(
            useCases: .init()
        )
        let viewModel = ServiceDetailsViewModel(interactor: interactor,
                                                onCancelAction: route.onCancelAction)
        let view = ServiceDetailsView(viewModel: viewModel, router: router)

        return view
    }
}
