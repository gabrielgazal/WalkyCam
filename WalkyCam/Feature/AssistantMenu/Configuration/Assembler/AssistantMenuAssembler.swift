import SwiftUI

final class AssistantMenuAssembler: AssistantMenuAssemblerProtocol {
    func resolveView(
        route: AssistantMenuRoute
    ) -> AssistantMenuView<AssistantMenuViewModel, AssistantMenuRouter> {

        let router = AssistantMenuRouter(isPresented: route.isPresented)

        let interactor = AssistantMenuInteractor(
            useCases: .init()
        )
        let viewModel = AssistantMenuViewModel(interactor: interactor)
        let view = AssistantMenuView(viewModel: viewModel, router: router)

        return view
    }
}
