import SwiftUI

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Dependencies

    var interactor: LoginInteractorProtocol

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var rememberPassword: SelectorModel = .init(value: "Recordar contraseña")
    @Published var loginUserAsyncData: AsyncData<LoginOutput, ErrorProtocol> = .idle
    @Published var toast: ToastModel? = nil
    
    // MARK: - Initialization

    init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func validateFields() -> Bool {
        return !userName.isEmpty && !password.isEmpty
    }

    @MainActor func loginUser(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        loginUserAsyncData = .loading
        do {
            let loginOutput = try await interactor.login(with: .init(userName: userName,
                                                           password: password))
            loginUserAsyncData = .loaded(loginOutput)
            onSuccess?()
        } catch {
            loginUserAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
    
    @MainActor func resetPassword() async {
        loginUserAsyncData = .loading
        do {
            try await interactor.resetPassword(email: userName)
            presentPasswordSuccessToast()
        } catch {
            loginUserAsyncData = .failed(GenericError())
            presentPasswordErrorToast()
        }
    }
    
    private func presentPasswordSuccessToast() {
        toast = ToastModel(
            style: .init(
                icon: Image(systemName: "checkmark.circle.fill"),
                background: .green2
            ),
            message: L10n.LoginView.ResetPassword.Success.toast,
            duration: 5,
            direction: .top,
            closable: true
        )
    }
    
    private func presentPasswordErrorToast() {
        toast = ToastModel(
            style: .init(
                icon: Image(systemName: "xmark.circle.fill"),
                background: .rojo
            ),
            message: L10n.LoginView.ResetPassword.Error.toast,
            duration: 3,
            direction: .top,
            closable: true
        )
    }
}
