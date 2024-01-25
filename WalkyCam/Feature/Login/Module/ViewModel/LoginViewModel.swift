import SwiftUI

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Dependencies

    var interactor: LoginInteractorProtocol

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var rememberPassword: SelectorModel = .init(value: "Recordar contraseña")
    @Published var loginUserAsyncData: AsyncData<Bool, ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func validateFields() -> Bool {
        return !userName.isEmpty && !password.isEmpty
    }

    @MainActor func loginUser() async {
        loginUserAsyncData = .loading
        do {
            let loginOutput = try await interactor.login(with: .init(userName: userName,
                                                           password: password))
            loginUserAsyncData = .loaded(loginOutput)
        } catch {
            loginUserAsyncData = .failed(GenericError())
        }
    }
}
