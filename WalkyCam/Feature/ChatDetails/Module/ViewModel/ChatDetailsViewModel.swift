import SwiftUI
import SendbirdChatSDK

final class ChatDetailsViewModel: ChatDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ChatDetailsInteractorProtocol
    @Published var channel: OpenChannel
    @Published var messages: [MessageModel] = []

    // MARK: - Initialization

    init(interactor: ChatDetailsInteractorProtocol,
         channel: OpenChannel) {
        self.interactor = interactor
        self.channel = channel
        self.getMessages()
    }
    
    // MARK: - Private Methods

    private func getMessages() {
        let params = MessageListParams()
        params.previousResultSize = 5
        params.nextResultSize = 5
        params.replyType = .all
        params.includeThreadInfo = true

        channel.getMessagesByTimestamp(Int64.max, params: params) { messages, error in
            guard error == nil else {
                print("Error loading messages")
                return
            }
            self.messages = messages?.compactMap { message in
                return MessageModel(id: String(message.messageId),
                                    isSenderMessage: message.isOperatorMessage,
                                    value: message.message)
            } ?? []
        }
    }
}
