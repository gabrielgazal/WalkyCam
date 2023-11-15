import SwiftUI

final class WalkyBotAssembler: WalkyBotAssemblerProtocol {
    func resolveView(
        route: WalkyBotRoute
    ) -> WalkyBotView<WalkyBotViewModel, WalkyBotRouter> {

        let router = WalkyBotRouter(isPresented: route.isPresented)

        let interactor = WalkyBotInteractor(
            useCases: .init()
        )
        let viewModel = WalkyBotViewModel(interactor: interactor)
        let view = WalkyBotView(viewModel: viewModel, router: router)

        return view
    }
}
