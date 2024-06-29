import SwiftUI

final class DroneConnectionAssembler: DroneConnectionAssemblerProtocol {
    func resolveView(
        route: DroneConnectionRoute
    ) -> DroneConnectionView<DroneConnectionViewModel, DroneConnectionRouter> {

        let router = DroneConnectionRouter(isPresented: route.isPresented)

        let interactor = DroneConnectionInteractor(
            useCases: .init()
        )
        let viewModel = DroneConnectionViewModel(interactor: interactor)
        let view = DroneConnectionView(viewModel: viewModel, router: router)

        return view
    }
}
