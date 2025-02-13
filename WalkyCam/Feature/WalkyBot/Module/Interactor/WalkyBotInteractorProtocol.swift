protocol WalkyBotInteractorProtocol {
    func getUserChatId(userId: String) async throws -> String
}
