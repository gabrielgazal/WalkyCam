import SwiftUI

final class ChatListAssembler: ChatListAssemblerProtocol {
    func resolveView(
        route: ChatListRoute
    ) -> ChatListView<ChatListViewModel, ChatListRouter> {

        let router = ChatListRouter(isPresented: route.isPresented)

        let interactor = ChatListInteractor(
            useCases: .init()
        )
        let viewModel = ChatListViewModel(interactor: interactor)
        let view = ChatListView(viewModel: viewModel, router: router)

        return view
    }
}
