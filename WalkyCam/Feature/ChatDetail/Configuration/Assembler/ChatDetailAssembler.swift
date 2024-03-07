import SwiftUI

final class ChatDetailAssembler: ChatDetailAssemblerProtocol {
    func resolveView(
        route: ChatDetailRoute
    ) -> ChatDetailView<ChatDetailViewModel, ChatDetailRouter> {

        let router = ChatDetailRouter(isPresented: route.isPresented)

        let interactor = ChatDetailInteractor(
            useCases: .init()
        )
        let viewModel = ChatDetailViewModel(interactor: interactor,
                                            chatModel: route.chatModel)
        let view = ChatDetailView(viewModel: viewModel, router: router)

        return view
    }
}
