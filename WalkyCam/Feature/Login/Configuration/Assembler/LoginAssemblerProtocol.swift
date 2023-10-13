import SwiftUI

protocol LoginAssemblerProtocol {
    func resolveView(
        route: LoginRoute
    ) -> LoginView<LoginViewModel, LoginRouter>
}
