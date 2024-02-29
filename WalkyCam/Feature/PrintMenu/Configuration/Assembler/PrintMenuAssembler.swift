import SwiftUI

final class PrintMenuAssembler: PrintMenuAssemblerProtocol {
    func resolveView(
        route: PrintMenuRoute
    ) -> PrintMenuView<PrintMenuViewModel, PrintMenuRouter> {

        let router = PrintMenuRouter(isPresented: route.isPresented)

        let interactor = PrintMenuInteractor(
            useCases: .init()
        )
        let viewModel = PrintMenuViewModel(interactor: interactor)
        let view = PrintMenuView(viewModel: viewModel, router: router)

        return view
    }
}
