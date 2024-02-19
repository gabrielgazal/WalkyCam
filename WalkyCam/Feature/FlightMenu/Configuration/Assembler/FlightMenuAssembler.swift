import SwiftUI

final class FlightMenuAssembler: FlightMenuAssemblerProtocol {
    func resolveView(
        route: FlightMenuRoute
    ) -> FlightMenuView<FlightMenuViewModel, FlightMenuRouter> {

        let router = FlightMenuRouter(isPresented: route.isPresented)

        let interactor = FlightMenuInteractor(
            useCases: .init()
        )
        let viewModel = FlightMenuViewModel(interactor: interactor)
        let view = FlightMenuView(viewModel: viewModel, router: router)

        return view
    }
}
