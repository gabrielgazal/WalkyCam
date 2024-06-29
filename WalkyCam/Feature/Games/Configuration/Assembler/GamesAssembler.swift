import SwiftUI

final class GamesAssembler: GamesAssemblerProtocol {
    func resolveView(
        route: GamesRoute
    ) -> GamesView<GamesViewModel, GamesRouter> {

        let router = GamesRouter(isPresented: route.isPresented)

        let interactor = GamesInteractor(
            useCases: .init()
        )
        let viewModel = GamesViewModel(interactor: interactor)
        let view = GamesView(viewModel: viewModel, router: router)

        return view
    }
}
