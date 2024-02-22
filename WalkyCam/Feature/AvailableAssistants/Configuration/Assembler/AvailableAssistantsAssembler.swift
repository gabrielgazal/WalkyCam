import SwiftUI

final class AvailableAssistantsAssembler: AvailableAssistantsAssemblerProtocol {
    func resolveView(
        route: AvailableAssistantsRoute
    ) -> AvailableAssistantsView<AvailableAssistantsViewModel, AvailableAssistantsRouter> {

        let router = AvailableAssistantsRouter(isPresented: route.isPresented)

        let interactor = AvailableAssistantsInteractor(
            useCases: .init()
        )
        let viewModel = AvailableAssistantsViewModel(interactor: interactor)
        let view = AvailableAssistantsView(viewModel: viewModel, router: router)

        return view
    }
}
