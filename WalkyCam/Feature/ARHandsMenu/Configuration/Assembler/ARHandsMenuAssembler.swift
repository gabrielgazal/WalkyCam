import SwiftUI

final class ARHandsMenuAssembler: ARHandsMenuAssemblerProtocol {
    func resolveView(
        route: ARHandsMenuRoute
    ) -> ARHandsMenuView<ARHandsMenuViewModel, ARHandsMenuRouter> {

        let router = ARHandsMenuRouter(isPresented: route.isPresented)

        let interactor = ARHandsMenuInteractor(
            useCases: .init()
        )
        let viewModel = ARHandsMenuViewModel(interactor: interactor)
        let view = ARHandsMenuView(viewModel: viewModel, router: router)

        return view
    }
}
