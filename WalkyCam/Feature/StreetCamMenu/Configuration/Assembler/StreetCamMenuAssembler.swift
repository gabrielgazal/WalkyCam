import SwiftUI

final class StreetCamMenuAssembler: StreetCamMenuAssemblerProtocol {
    func resolveView(
        route: StreetCamMenuRoute
    ) -> StreetCamMenuView<StreetCamMenuViewModel, StreetCamMenuRouter> {

        let router = StreetCamMenuRouter(isPresented: route.isPresented)

        let interactor = StreetCamMenuInteractor(
            useCases: .init()
        )
        let viewModel = StreetCamMenuViewModel(interactor: interactor)
        let view = StreetCamMenuView(viewModel: viewModel, router: router)

        return view
    }
}
