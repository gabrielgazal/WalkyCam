import SwiftUI

final class AppleWatchSimulatorAssembler: AppleWatchSimulatorAssemblerProtocol {
    func resolveView(
        route: AppleWatchSimulatorRoute
    ) -> AppleWatchSimulatorView<AppleWatchSimulatorViewModel, AppleWatchSimulatorRouter> {

        let router = AppleWatchSimulatorRouter(isPresented: route.isPresented)

        let interactor = AppleWatchSimulatorInteractor(
            useCases: .init()
        )
        let viewModel = AppleWatchSimulatorViewModel(interactor: interactor)
        let view = AppleWatchSimulatorView(viewModel: viewModel, router: router)

        return view
    }
}
