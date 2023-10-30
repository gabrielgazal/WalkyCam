import SwiftUI

final class StartupAssembler: StartupAssemblerProtocol {
    func resolveView(
        route: StartupRoute
    ) -> StartupView<StartupViewModel, StartupRouter> {

        let router = StartupRouter(isPresented: route.isPresented)

        let interactor = StartupInteractor(
            useCases: .init()
        )
        let viewModel = StartupViewModel(interactor: interactor)
        let view = StartupView(viewModel: viewModel, router: router)

        return view
    }
}
