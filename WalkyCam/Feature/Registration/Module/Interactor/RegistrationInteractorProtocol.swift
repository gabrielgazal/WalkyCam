protocol RegistrationInteractorProtocol {
    func register(with input: RegistrationInput) async throws -> RegistrationOutput
}
