import SwiftUI
import Networking

final class WalkyBotAssembler: WalkyBotAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: WalkyBotRoute
    ) -> WalkyBotView<WalkyBotViewModel, WalkyBotRouter> {

        let router = WalkyBotRouter(isPresented: route.isPresented)

        let repository = retailRepository.resolve(AuthRepositoryProtocol.self)
        
        let interactor = WalkyBotInteractor(
            useCases: .init(
                getUserChatId: .live(repository: repository)
            )
        )
        let viewModel = WalkyBotViewModel(interactor: interactor)
        let view = WalkyBotView(viewModel: viewModel, router: router)

        return view
    }
}
