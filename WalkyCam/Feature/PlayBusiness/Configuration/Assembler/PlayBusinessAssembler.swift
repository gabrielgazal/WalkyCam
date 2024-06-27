import SwiftUI

final class PlayBusinessAssembler: PlayBusinessAssemblerProtocol {
    func resolveView(
        route: PlayBusinessRoute
    ) -> PlayBusinessView<PlayBusinessViewModel, PlayBusinessRouter> {

        let router = PlayBusinessRouter(isPresented: route.isPresented)

        let interactor = PlayBusinessInteractor(
            useCases: .init()
        )
        let viewModel = PlayBusinessViewModel(interactor: interactor)
        let view = PlayBusinessView(viewModel: viewModel, router: router)

        return view
    }
}
