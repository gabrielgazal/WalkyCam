import SwiftUI

final class ChatDetailsAssembler: ChatDetailsAssemblerProtocol {
    func resolveView(
        route: ChatDetailsRoute
    ) -> ChatDetailsView<ChatDetailsViewModel, ChatDetailsRouter> {

        let router = ChatDetailsRouter(isPresented: route.isPresented)

        let interactor = ChatDetailsInteractor(
            useCases: .init()
        )
        let viewModel = ChatDetailsViewModel(interactor: interactor,
                                             channel: route.channel)
        let view = ChatDetailsView(viewModel: viewModel, router: router)

        return view
    }
}
