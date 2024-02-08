import SwiftUI
import SendbirdChatSDK

final class ChatRouter: Router, ChatRouterProtocol {

    // MARK: - Public API

    func routeToChatDetails(channel: OpenChannel) {
        navigateTo(
            ChatDetailsRoute(isPresented: isNavigating, channel: channel)
        )
    }
}

