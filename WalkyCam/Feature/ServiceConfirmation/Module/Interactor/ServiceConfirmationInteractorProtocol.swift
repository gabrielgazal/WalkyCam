protocol ServiceConfirmationInteractorProtocol {
    func saveVideoCall() async throws -> String
    func cancelVideoCall() async throws -> Void
}
