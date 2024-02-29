import SwiftUI

final class Scan3DMenuAssembler: Scan3DMenuAssemblerProtocol {
    func resolveView(
        route: Scan3DMenuRoute
    ) -> Scan3DMenuView<Scan3DMenuViewModel, Scan3DMenuRouter> {

        let router = Scan3DMenuRouter(isPresented: route.isPresented)

        let interactor = Scan3DMenuInteractor(
            useCases: .init()
        )
        let viewModel = Scan3DMenuViewModel(interactor: interactor)
        let view = Scan3DMenuView(viewModel: viewModel, router: router)

        return view
    }
}
