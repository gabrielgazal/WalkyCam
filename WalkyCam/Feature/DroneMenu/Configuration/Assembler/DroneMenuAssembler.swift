import SwiftUI

final class DroneMenuAssembler: DroneMenuAssemblerProtocol {
    func resolveView(
        route: DroneMenuRoute
    ) -> DroneMenuView<DroneMenuViewModel, DroneMenuRouter> {

        let router = DroneMenuRouter(isPresented: route.isPresented)

        let interactor = DroneMenuInteractor(
            useCases: .init()
        )
        let viewModel = DroneMenuViewModel(interactor: interactor)
        let view = DroneMenuView(viewModel: viewModel, router: router)

        return view
    }
}
