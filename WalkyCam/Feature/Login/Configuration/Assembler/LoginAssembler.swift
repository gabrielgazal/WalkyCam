import SwiftUI

final class LoginAssembler: LoginAssemblerProtocol {
    func resolveView(
        route: LoginRoute
    ) -> LoginView<LoginViewModel, LoginRouter> {

        let router = LoginRouter(isPresented: route.isPresented)

        let viewModel = LoginViewModel()
        let view = LoginView(viewModel: viewModel, router: router)

        return view
    }
}
