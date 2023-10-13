import SwiftUI

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Dependencies

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var rememberPassword: SelectorModel = .init(value: "Recordar contraseña")

    // MARK: - Initialization

    init() {}

    // MARK: - Public API

    func validateFields() -> Bool {
        return !userName.isEmpty && !password.isEmpty
    }
}
