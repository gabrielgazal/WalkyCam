import SwiftUI
import Networking

final class RegistrationAssembler: RegistrationAssemblerProtocol {
    func resolveView(
        route: RegistrationRoute
    ) -> RegistrationView<RegistrationViewModel, RegistrationRouter> {

        let router = RegistrationRouter(state: RouterState(isPresented: route.isPresented))

        let repository = route.retailRepository.resolve(AuthRepositoryProtocol.self)

        let interactor = RegistrationInteractor(
            useCases: .init(registerUseCase: .live(repository: repository))
        )
        let viewModel = RegistrationViewModel(interactor: interactor,
                                              router: router)
        let view = RegistrationView(viewModel: viewModel, router: router)

        return view
    }
}
