import SwiftUI

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Dependencies

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var rememberPassword: SelectorModel = .init(value: "Recordar contraseña")

    // MARK: - Initialization

    init() {}

    // MARK: - Public API

#warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

#warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
