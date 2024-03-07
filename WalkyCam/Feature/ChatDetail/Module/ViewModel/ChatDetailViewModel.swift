import SwiftUI
import SendbirdChatSDK

final class ChatDetailViewModel: ChatDetailViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatDetailInteractorProtocol
    @Published var chatModel: ChannelModel
    @Published var messages: AsyncData<[MessageModel], ErrorProtocol> = .idle
    @Published var currentMessage = ""
    @Published var messageObserver: MessageObserver = MessageObserver()

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
        GroupChannel.getChannel(url: chatModel.chatURL) { channel, error in
            guard let channel = channel else { return }
            if !self.currentMessage.isEmpty {
                channel.sendUserMessage(self.currentMessage) { message, error in
                    guard let message = message else {
                        print("Erro no envio")
                        return
                    }
                    print("mensagem enviada com sucesso!")
                    self.loadNewTexts()
                    self.currentMessage = ""
                }
            }
        }
    }

    func loadMessages() {
        self.messages = .loading
        let params = MessageListParams()
        params.reverse = true
        params.nextResultSize = 200
        params.previousResultSize = 200
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
                                        value: item.message,
                                        timeStamp: item.createdAt)
                }.sorted { $0.timeStamp > $1.timeStamp }
                self.messages = .loaded(mappedMessages)
            }
        }
    }

    func loadNewTexts() {
        let params = MessageListParams()
        params.reverse = true
        params.nextResultSize = 200
        params.previousResultSize = 200
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
                                        value: item.message,
                                        timeStamp: item.createdAt)
                }.sorted { $0.timeStamp > $1.timeStamp }
                self.messages = .loaded(mappedMessages)
            }
        }
    }

    func subscribeToChannelEvents() {
        SendbirdChat.addChannelDelegate(self.messageObserver, identifier: "ChatMessageObserverId")
    }
}
