import SwiftUI

final class ChatAssembler: ChatAssemblerProtocol {
    func resolveView(
        route: ChatRoute
    ) -> ChatView<ChatViewModel, ChatRouter> {

        let router = ChatRouter(isPresented: route.isPresented)

        let interactor = ChatInteractor(
            useCases: .init()
        )
        let viewModel = ChatViewModel(interactor: interactor)
        let view = ChatView(viewModel: viewModel, router: router)

        return view
    }
}
