import SwiftUI

final class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Dependencies

    var interactor: LoginInteractorProtocol

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var rememberPassword: SelectorModel = .init(value: "Recordar contraseña")
    @Published var loginUserAsyncData: AsyncData<LoginOutput, ErrorProtocol> = .idle

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
    
    func isPasswordRight() -> [PasswordConfigurationError] {
        var errorsToReturn: [PasswordConfigurationError] = []
        
        if password.count < 8 {
            errorsToReturn.append(.small)
        }
        
        if password.rangeOfCharacter(from: CharacterSet.symbols) == nil {
            errorsToReturn.append(.missingSymbolNumber)
        }
        
        if password.contains(" ") {
            errorsToReturn.append(.spaces)
        }
        
        if password.isEmpty {
            errorsToReturn.append(contentsOf: PasswordConfigurationError.allCases)
        }
        
        return errorsToReturn
    }

}
