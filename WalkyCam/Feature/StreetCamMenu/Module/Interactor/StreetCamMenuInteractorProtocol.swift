protocol StreetCamMenuInteractorProtocol {
    func startCreationStreetcam() async throws -> VideoCallOutput
    func startScheduleStreetcam() async throws -> VideoCallOutput
}
