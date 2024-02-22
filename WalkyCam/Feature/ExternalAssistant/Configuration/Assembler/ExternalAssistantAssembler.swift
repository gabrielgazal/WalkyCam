import SwiftUI

final class ExternalAssistantAssembler: ExternalAssistantAssemblerProtocol {
    func resolveView(
        route: ExternalAssistantRoute
    ) -> ExternalAssistantView<ExternalAssistantViewModel, ExternalAssistantRouter> {

        let router = ExternalAssistantRouter(isPresented: route.isPresented)

        let interactor = ExternalAssistantInteractor(
            useCases: .init()
        )
        let viewModel = ExternalAssistantViewModel(interactor: interactor)
        let view = ExternalAssistantView(viewModel: viewModel, router: router)

        return view
    }
}
