import SwiftUI
import SendbirdChatSDK

final class ChatViewModel: ChatViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatInteractorProtocol
    private var userID = "testegazodia123123"
    @Published var channels: [ChannelModel] = []
    @State private var openChannels: [OpenChannel] = []

    // MARK: - Initialization

    init(interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
        self.initializeUser()
    }

    // MARK: - Public API

    func handleChatSelection(_ id: String) -> OpenChannel? {
        return openChannels.first(where: { $0.id == id })
    }

    // MARK: - Private Methods

    private func initializeUser() {
        SendbirdChat.connect(userId: userID) { user, error in
            guard let user = user,
                  error == nil else {
                print("Connection error")
                return
            }
            print("Connected")
            self.getOpenChannels()
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

    private func getOpenChannels() {
        let query = OpenChannel.createOpenChannelListQuery()
        query.loadNextPage { channels, error in
            guard error == nil else {
                print("Erros nos canais")
                return
            }
            self.openChannels.append(contentsOf: channels ?? [])
            let mappedChannels = channels?.compactMap { channel in
                return ChannelModel(id: channel.id,
                                    title: channel.name,
                                    image: channel.coverURL,
                                    timeStamp: String(channel.createdAt),
                                    chatOpened: false,
                                    lastMessage: "Teste de mensagem")
            }
            self.channels.append(contentsOf: mappedChannels ?? [])
        }
    }

    private func getGroupChannels() {
        let params = GroupChannelListQueryParams()
        params.includeEmptyChannel = true
        params.order = .chronological
        let query = GroupChannel.createMyGroupChannelListQuery(params: params)
        let collection = SendbirdChat.createGroupChannelCollection(query: query)
        if collection?.hasNext == true {
            collection?.loadMore(completionHandler: { channels, error in
                guard error == nil else {
                    print("Erro nas mensagens em grupo")
                    return
                }
                let mappedChannels = channels?.compactMap { channel in
                    return ChannelModel(id: channel.id,
                                        title: channel.name,
                                        image: channel.coverURL,
                                        timeStamp: String(channel.createdAt),
                                        chatOpened: false,
                                        lastMessage: "TEste de mensagem em grupo")
                }
                self.channels.append(contentsOf: mappedChannels ?? [])
            })
        }
    }
}
