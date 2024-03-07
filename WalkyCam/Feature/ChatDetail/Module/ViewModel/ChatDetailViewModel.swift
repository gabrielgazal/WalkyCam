import SwiftUI
import SendbirdChatSDK

final class ChatDetailViewModel: ChatDetailViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatDetailInteractorProtocol
    @Published var chatModel: ChannelModel
    @Published var messages: AsyncData<[MessageModel], ErrorProtocol> = .idle
    @Published var currentMessage = ""

    // MARK: - Initialization

    init(
        interactor: ChatDetailInteractorProtocol = ChatDetailInteractor(),
        chatModel: ChannelModel
    ) {
        self.interactor = interactor
        self.chatModel = chatModel
    }

    // MARK: - Public API

    func sendMessage() {
        print("Enviou")
    }

    func loadMessages() {
        self.messages = .loading
        let params = MessageListParams()
        params.reverse = true
        params.nextResultSize = 50
        GroupChannel.getChannel(url: chatModel.chatURL) { channel, error in
            guard let channel = channel else { return }
            channel.getMessagesByTimestamp(0, params: params) { messages, error in
                guard let messages = messages else {
                    print("Erro nas mensagens")
                    self.messages = .failed(GenericError())
                    return
                }
                let mappedMessages = messages.compactMap { item in
                    return MessageModel(id: item.messageId.description,
                                        isSenderMessage: item.isOperatorMessage,
                                        value: item.message)
                }
                self.messages = .loaded(mappedMessages)
            }
        }
    }
}
