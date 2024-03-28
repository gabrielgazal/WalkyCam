import SwiftUI

final class RadarMenuAssembler: RadarMenuAssemblerProtocol {
    func resolveView(
        route: RadarMenuRoute
    ) -> RadarMenuView<RadarMenuViewModel, RadarMenuRouter> {

        let router = RadarMenuRouter(isPresented: route.isPresented)

        let interactor = RadarMenuInteractor(
            useCases: .init()
        )
        let viewModel = RadarMenuViewModel(interactor: interactor)
        let view = RadarMenuView(viewModel: viewModel, router: router)

        return view
    }
}
