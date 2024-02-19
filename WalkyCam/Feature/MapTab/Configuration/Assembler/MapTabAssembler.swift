import SwiftUI

final class MapTabAssembler: MapTabAssemblerProtocol {
    func resolveView(
        route: MapTabRoute
    ) -> MapTabView<MapTabViewModel, MapTabRouter> {

        let router = MapTabRouter(isPresented: route.isPresented)

        let interactor = MapTabInteractor(
            useCases: .init()
        )
        let viewModel = MapTabViewModel(interactor: interactor)
        let view = MapTabView(viewModel: viewModel, router: router)

        return view
    }
}
