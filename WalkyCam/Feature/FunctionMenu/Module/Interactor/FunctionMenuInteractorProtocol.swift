protocol FunctionMenuInteractorProtocol {
    func startCreation() async throws -> VideoCallOutput
    func startSchedule() async throws -> VideoCallOutput
}
