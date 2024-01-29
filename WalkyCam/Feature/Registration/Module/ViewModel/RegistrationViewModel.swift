import SwiftUI

final class RegistrationViewModel: RegistrationViewModelProtocol {

    // MARK: - Dependencies
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto los Términos y Condiciones de WalkyCam")
    @Published var registerUserAsyncData: AsyncData<RegistrationOutput, ErrorProtocol> = .idle

    private let interactor: RegistrationInteractorProtocol

    // MARK: - Initialization

    init(interactor: RegistrationInteractorProtocol) {
        self.interactor = interactor
    }


    // MARK: - Public API

    func isRegisterButtonDisabled() -> Bool {
        return name.isEmpty || lastName.isEmpty || username.isEmpty || password.isEmpty || email.isEmpty || !acceptedTerms.isSelected
    }

    @MainActor func registerUser(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        registerUserAsyncData = .loading
        do {
            let registrationOutput = try await interactor.register(
                with: .init(
                    name: name,
                    lastName: lastName,
                    userName: username,
                    email: email,
                    password: password)
            )
            registerUserAsyncData = .loaded(registrationOutput)
            onSuccess?()
        } catch {
            registerUserAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
}
