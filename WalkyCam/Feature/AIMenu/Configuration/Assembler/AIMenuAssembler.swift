import SwiftUI

final class AIMenuAssembler: AIMenuAssemblerProtocol {
    func resolveView(
        route: AIMenuRoute
    ) -> AIMenuView<AIMenuViewModel, AIMenuRouter> {

        let router = AIMenuRouter(isPresented: route.isPresented)

        let interactor = AIMenuInteractor(
            useCases: .init()
        )
        let viewModel = AIMenuViewModel(interactor: interactor)
        let view = AIMenuView(viewModel: viewModel, router: router)

        return view
    }
}
