import SwiftUI

protocol ChatListAssemblerProtocol {
    func resolveView(
        route: ChatListRoute
    ) -> ChatListView<ChatListViewModel, ChatListRouter>
}