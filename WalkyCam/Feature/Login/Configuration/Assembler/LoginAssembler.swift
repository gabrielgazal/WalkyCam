import SwiftUI
import Networking

final class LoginAssembler: LoginAssemblerProtocol {
    func resolveView(
        route: LoginRoute
    ) -> LoginView<LoginViewModel, LoginRouter> {

        let router = LoginRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(AuthRepositoryProtocol.self)

        let interactor = LoginInteractor(
            useCases: .init(
                login: .static(true)
            )
        )
        
        let viewModel = LoginViewModel(interactor: interactor)
        let view = LoginView(viewModel: viewModel, router: router)

        return view
    }
}
