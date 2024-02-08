import SwiftUI

protocol ChatAssemblerProtocol {
    func resolveView(
        route: ChatRoute
    ) -> ChatView<ChatViewModel, ChatRouter>
}