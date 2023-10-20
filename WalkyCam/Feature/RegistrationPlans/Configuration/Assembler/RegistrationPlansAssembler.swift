import SwiftUI

final class RegistrationPlansAssembler: RegistrationPlansAssemblerProtocol {
    func resolveView(
        route: RegistrationPlansRoute
    ) -> RegistrationPlansView<RegistrationPlansViewModel, RegistrationPlansRouter> {

        let router = RegistrationPlansRouter(isPresented: route.isPresented)

        let interactor = RegistrationPlansInteractor(
            useCases: .init()
        )
        let viewModel = RegistrationPlansViewModel(interactor: interactor)
        let view = RegistrationPlansView(viewModel: viewModel, router: router)

        return view
    }
}
