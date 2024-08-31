protocol ServiceDetailsInteractorProtocol {
    func updateVideoCall(_ data: UpdateVideoCallInput) async throws -> String
    func cancelVideoCall() async throws -> Void
}
