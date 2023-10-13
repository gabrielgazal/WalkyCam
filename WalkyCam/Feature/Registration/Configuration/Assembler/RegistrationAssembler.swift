import SwiftUI

final class RegistrationAssembler: RegistrationAssemblerProtocol {
    func resolveView(
        route: RegistrationRoute
    ) -> RegistrationView<RegistrationViewModel, RegistrationRouter> {

        let router = RegistrationRouter(isPresented: route.isPresented)

        let interactor = RegistrationInteractor(
            useCases: .init()
        )
        let viewModel = RegistrationViewModel(interactor: interactor)
        let view = RegistrationView(viewModel: viewModel, router: router)

        return view
    }
}
