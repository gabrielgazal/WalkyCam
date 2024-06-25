import SwiftUI

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

    func initializeUser() {}

    func loadMessages() {}

    func loadNewTexts() {}

    func subscribeToChannelEvents() {}

    func sendMessage() {}
}
