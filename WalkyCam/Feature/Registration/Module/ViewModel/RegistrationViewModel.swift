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
    private let router: RegistrationRouterProtocol
    
    // MARK: - Initialization

    init(interactor: RegistrationInteractorProtocol,
         router: RegistrationRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }


    // MARK: - Public API

    func isRegisterButtonDisabled() -> Bool {
        return name.isEmpty || lastName.isEmpty || username.isEmpty || password.isEmpty || email.isEmpty || !acceptedTerms.isSelected
    }

    @MainActor func registerUser() async {
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
            router.routeToConfirmMail()
        } catch {
            registerUserAsyncData = .failed(GenericError())
            router.presentSnackbar(
                SnackBarRoute(
                    isPresented: router.isPresentingSnackbar,
                    title: error.localizedDescription,
                    style: InformationViewErrorStyle()
                )
            )
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
