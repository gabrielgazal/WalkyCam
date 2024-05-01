import SwiftUI

final class RegisterWalkcamerViewModel: RegisterWalkcamerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RegisterWalkcamerInteractorProtocol
    @Published var registrationData: CamerRegistrationData = .init()
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto los Términos y Condiciones de WalkyCam")
    
    // MARK: - Initialization

    init(interactor: RegisterWalkcamerInteractorProtocol = RegisterWalkcamerInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func isRegisterButtonDisabled() -> Bool {
        return registrationData.name.isEmpty || registrationData.lastName.isEmpty || registrationData.phoneNumber.isEmpty || registrationData.email.isEmpty || !acceptedTerms.isSelected
    }
}
