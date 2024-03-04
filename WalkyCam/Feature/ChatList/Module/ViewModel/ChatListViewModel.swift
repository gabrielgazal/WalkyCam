import SwiftUI
import SendbirdChatSDK

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

    private func initializeUser() {
        channels = .loading
        SendbirdChat.connect(userId: userID) { user, error in
            guard let user = user,
                  error == nil else {
                print("Connection error")
                return
            }
            print("Connected")
            self.getGroupChannels()
        }
    }

    private func getGroupChannels() {
        GroupChannel.createMyGroupChannelListQuery().loadNextPage { channels, error in
            if let channels = channels {
                let mappedChannels = channels.compactMap { channel in
                    return channel.isHidden ? nil : ChannelModel(id: channel.id,
                                        title: channel.name,
                                        image: channel.coverURL,
                                        timeStamp: String(channel.createdAt),
                                        chatOpened: channel.unreadMessageCount == 0,
                                        lastMessage: channel.lastMessage?.message ?? "",
                                        chatURL: channel.channelURL)
                }
                self.channels = .loaded(mappedChannels)
            } else {
                print("Erro nas mensagens")
            }
        }
    }
}
