import SwiftUI

final class IOTSensorsAssembler: IOTSensorsAssemblerProtocol {
    func resolveView(
        route: IOTSensorsRoute
    ) -> IOTSensorsView<IOTSensorsViewModel, IOTSensorsRouter> {

        let router = IOTSensorsRouter(isPresented: route.isPresented)

        let interactor = IOTSensorsInteractor(
            useCases: .init()
        )
        let viewModel = IOTSensorsViewModel(interactor: interactor)
        let view = IOTSensorsView(viewModel: viewModel, router: router)

        return view
    }
}
