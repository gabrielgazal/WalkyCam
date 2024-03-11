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

        GroupChannel.getChannel(url: chatModel.chatURL) { channel, error in
            guard let channel = channel else { return }
            let timeStamp = Int64(Date().timeIntervalSince1970)
            let collection = SendbirdChat.createMessageCollection(channel: channel,
                                                                  startingPoint: timeStamp,
                                                                  params: params)
            collection.delegate = self
            collection.startCollection(initPolicy: .cacheAndReplaceByApi) { messages, error in
                // TESTE
            } apiResultHandler: { messages, error in
                //
            }
            collection.loadNext { messages, error in
                let mappedMessages = messages?.compactMap { item in
                    return MessageModel(id: item.messageId.description,
                                        isSenderMessage: item.isOperatorMessage,
                                        value: item.message,
                                        timeStamp: item.createdAt)
                }
                self.messages = .loaded(mappedMessages ?? [])
            }
        }
    }

    func loadNewTexts() {
        let params = MessageListParams()
        params.reverse = true
        params.nextResultSize = 200

        GroupChannel.getChannel(url: chatModel.chatURL) { channel, error in
            guard let channel = channel else { return }
            let timeStamp = Int64(Date().timeIntervalSince1970)
            let collection = SendbirdChat.createMessageCollection(channel: channel,
                                                                  startingPoint: timeStamp,
                                                                  params: params)
            collection.delegate = self
            collection.startCollection(initPolicy: .cacheAndReplaceByApi) { messages, error in
                // TESTE
            } apiResultHandler: { messages, error in
                //
            }
            collection.loadNext { messages, error in
                let mappedMessages = messages?.compactMap { item in
                    return MessageModel(id: item.messageId.description,
                                        isSenderMessage: item.isOperatorMessage,
                                        value: item.message,
                                        timeStamp: item.createdAt)
                }
                self.messages = .loaded(mappedMessages ?? [])
            }
        }
    }

    func subscribeToChannelEvents() {
        SendbirdChat.addChannelDelegate(self.messageObserver, identifier: "ChatMessageObserverId")
    }
}

extension ChatDetailViewModel: MessageCollectionDelegate {}
