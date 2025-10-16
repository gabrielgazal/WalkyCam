import SwiftUI

final class PrintConfirmationAssembler: PrintConfirmationAssemblerProtocol {
    func resolveView(
        route: PrintConfirmationRoute
    ) -> PrintConfirmationView<PrintConfirmationViewModel, PrintConfirmationRouter> {

        let router = PrintConfirmationRouter(isPresented: route.isPresented)

        let interactor = PrintConfirmationInteractor(
            useCases: .init()
        )
        let viewModel = PrintConfirmationViewModel(interactor: interactor)
        let view = PrintConfirmationView(viewModel: viewModel, router: router)

        return view
    }
}
