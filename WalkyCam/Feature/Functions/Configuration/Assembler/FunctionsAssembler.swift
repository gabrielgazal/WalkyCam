import SwiftUI

final class FunctionsAssembler: FunctionsAssemblerProtocol {
    func resolveView(
        route: FunctionsRoute
    ) -> FunctionsView<FunctionsViewModel, FunctionsRouter> {

        let router = FunctionsRouter(isPresented: route.isPresented)

        let interactor = FunctionsInteractor(
            useCases: .init()
        )
        let viewModel = FunctionsViewModel(interactor: interactor)
        let view = FunctionsView(viewModel: viewModel, router: router)

        return view
    }
}
