import SwiftUI

final class RegisterWalkcamerViewModel: RegisterWalkcamerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RegisterWalkcamerInteractorProtocol
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var telephone: String = ""
    @Published var email: String = ""
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto los Términos y Condiciones de WalkyCam")
    
    // MARK: - Initialization

    init(interactor: RegisterWalkcamerInteractorProtocol = RegisterWalkcamerInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func isRegisterButtonDisabled() -> Bool {
        return name.isEmpty || lastName.isEmpty || telephone.isEmpty || email.isEmpty || !acceptedTerms.isSelected
    }
}
