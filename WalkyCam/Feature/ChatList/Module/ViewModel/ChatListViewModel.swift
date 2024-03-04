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

    private func messageTest() {
        let params = OpenChannelCreateParams()
        params.name = "Mensageria Gazal"
        OpenChannel.createChannel(params: params) { channel, error in
            guard let canal = channel, error == nil else {
                print("Teste")
                return
            }
            canal.enter { error in
                guard error == nil else { return }
            }
            canal.sendUserMessage("TESTEEE") { message, error in
                guard let message = message, error == nil else { return }
            }
        }
    }

    private func getGroupChannels() {
        GroupChannel.createMyGroupChannelListQuery().loadNextPage { channels, error in
            if let channels = channels {
                let mappedChannels = channels.compactMap { channel in
                    if channel.isHidden {

                    }
                    return ChannelModel(id: channel.id,
                                        title: channel.name,
                                        image: channel.coverURL,
                                        timeStamp: String(channel.createdAt),
                                        chatOpened: false,
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
