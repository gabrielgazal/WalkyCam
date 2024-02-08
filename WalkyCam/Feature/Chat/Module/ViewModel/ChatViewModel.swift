import SwiftUI
import SendbirdChatSDK

final class ChatViewModel: ChatViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatInteractorProtocol
    private var userID = "testegazodia123123"
    @Published var channels: [ChannelModel] = []

    // MARK: - Initialization

    init(interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
        self.initializeUser()
    }

    // MARK: - Private Methods

    private func initializeUser() {
        SendbirdChat.connect(userId: "testegazodia123123@@!11") { user, error in
            guard let user = user,
                  error == nil else {
                print("Connection error")
                return
            }
            print("Connected")
            self.getChannels()
        }
    }

    private func getChannels() {
        let query = OpenChannel.createOpenChannelListQuery()
        query.loadNextPage { channels, error in
            guard error == nil else {
                print("Erros nos canais")
                return
            }
            let mappedChannels = channels?.compactMap { channel in
                return ChannelModel(id: channel.id,
                                    title: channel.name,
                                    image: channel.coverURL,
                                    timeStamp: String(channel.createdAt),
                                    chatOpened: false,
                                    lastMessage: "Teste de mensagem")
            }
            self.channels = mappedChannels ?? []
        }
    }
}
