import SwiftUI

final class ChatListRouter: Router, ChatListRouterProtocol {

    // MARK: - Public API

    func routeToChatDetails(_ data: ChannelModel) {
        navigateTo(
            ChatDetailRoute(isPresented: isNavigating,
                            chatModel: data)
        )
    }
}

