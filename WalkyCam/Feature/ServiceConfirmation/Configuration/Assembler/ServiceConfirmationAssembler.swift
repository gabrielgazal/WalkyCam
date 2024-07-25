import SwiftUI

final class ServiceConfirmationAssembler: ServiceConfirmationAssemblerProtocol {
    func resolveView(
        route: ServiceConfirmationRoute
    ) -> ServiceConfirmationView<ServiceConfirmationViewModel, ServiceConfirmationRouter> {

        let router = ServiceConfirmationRouter(isPresented: route.isPresented)

        let interactor = ServiceConfirmationInteractor(
            useCases: .init()
        )
        let viewModel = ServiceConfirmationViewModel(interactor: interactor)
        let view = ServiceConfirmationView(viewModel: viewModel, router: router)

        return view
    }
}
