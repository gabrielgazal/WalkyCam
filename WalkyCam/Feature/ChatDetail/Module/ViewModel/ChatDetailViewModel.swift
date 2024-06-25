import SwiftUI

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

    func sendMessage() {}

    func loadMessages() {}

    func loadNewTexts() {}

    func subscribeToChannelEvents() {}
}
