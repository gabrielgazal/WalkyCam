import SwiftUI
import SendbirdChatSDK

final class WalkyBotViewModel: WalkyBotViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyBotInteractorProtocol
    @Published var messages: AsyncData<[MessageModel], ErrorProtocol> = .idle
    @Published var currentMessage = ""
    @Published var messageObserver: MessageObserver = MessageObserver()
    private var chatURL = "sendbird_group_channel_344834546_34fed5d949575d21be89865869ee70c8b2252f00"
    private var userID = "developer"

    // MARK: - Initialization

    init(interactor: WalkyBotInteractorProtocol = WalkyBotInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func initializeUser() {
        SendbirdChat.connect(userId: userID) { user, error in
            guard let user = user,
                  error == nil else {
                print("Connection error")
                return
            }
            print("Connected")
            self.loadMessages()
        }
    }

    func loadMessages() {
        self.messages = .loading
        let params = MessageListParams()
        params.reverse = true
        params.nextResultSize = 200

        GroupChannel.getChannel(url: chatURL) { channel, error in
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

        GroupChannel.getChannel(url: chatURL) { channel, error in
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

    func sendMessage() {
        GroupChannel.getChannel(url: chatURL) { channel, error in
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
}

extension WalkyBotViewModel: MessageCollectionDelegate {}
