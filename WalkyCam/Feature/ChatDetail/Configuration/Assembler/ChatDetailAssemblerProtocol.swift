import SwiftUI

protocol ChatDetailAssemblerProtocol {
    func resolveView(
        route: ChatDetailRoute
    ) -> ChatDetailView<ChatDetailViewModel, ChatDetailRouter>
}