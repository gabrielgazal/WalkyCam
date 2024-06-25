import SwiftUI

final class ChatListViewModel: ChatListViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatListInteractorProtocol
    private var userID = "developer"
    @Published var channels: AsyncData<[ChannelModel], ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: ChatListInteractorProtocol = ChatListInteractor()) {
        self.interactor = interactor
        self.initializeUser()
    }

    // MARK: - Private API

    func handleChatSelection(_ id: String) -> ChannelModel? {
        return channels.loadedValue?.first(where: { $0.id == id })
    }

    // MARK: - Private Methods

    private func initializeUser() {}

    private func getGroupChannels() {}
}
