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
                    return self.mapObjectToModel(channel)
                }
                self.channels = .loaded(mappedChannels)
            } else {
                print("Erro nas mensagens")
            }
        }
    }

    private func mapObjectToModel(_ input: GroupChannel) -> ChannelModel? {
        let member = input.members.first(where: { $0.id != "developer" })
        return input.lastMessage == nil ? nil : ChannelModel(id: input.id,
                                                             title: member?.nickname ?? "(No members)",
                                                             image: input.coverURL ?? "",
                                                             timeStamp: String(input.lastMessage?.createdAt ?? 0),
                                                             chatOpened: input.unreadMessageCount == 0,
                                                             lastMessage: input.lastMessage?.message ?? "",
                                                             chatURL: input.channelURL)
    }
}
