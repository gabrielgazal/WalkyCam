import SwiftUI

final class ConfirmMailAssembler: ConfirmMailAssemblerProtocol {
    func resolveView(
        route: ConfirmMailRoute
    ) -> ConfirmMailView<ConfirmMailViewModel, ConfirmMailRouter> {

        let router = ConfirmMailRouter(isPresented: route.isPresented)

        let interactor = ConfirmMailInteractor(
            useCases: .init()
        )
        let viewModel = ConfirmMailViewModel(interactor: interactor)
        let view = ConfirmMailView(viewModel: viewModel, router: router)

        return view
    }
}
