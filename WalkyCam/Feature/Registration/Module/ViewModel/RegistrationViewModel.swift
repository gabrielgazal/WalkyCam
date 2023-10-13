import SwiftUI

final class RegistrationViewModel: RegistrationViewModelProtocol {

    // MARK: - Dependencies
    @Published var name: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var acceptedTerms: SelectorModel = .init(value: "Acepto los Términos y Condiciones de WalkyCam")

    private let interactor: RegistrationInteractorProtocol

    // MARK: - Initialization

    init(interactor: RegistrationInteractorProtocol = RegistrationInteractor()) {
        self.interactor = interactor
    }

}
