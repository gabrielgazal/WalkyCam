protocol VideoCallInteractorProtocol {
    func createVideoCall() async throws -> String
    func startScheduleVideoCall() async throws -> String
}
