protocol ProfileInteractorProtocol {
    func fetchUserData() async -> UserSessionData
    func updateUserData(_ user: UserData) async throws -> UserData
}
