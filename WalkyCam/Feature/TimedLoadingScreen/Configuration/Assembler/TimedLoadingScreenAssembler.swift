import SwiftUI

final class TimedLoadingScreenAssembler: TimedLoadingScreenAssemblerProtocol {
    func resolveView(
        route: TimedLoadingScreenRoute
    ) -> TimedLoadingScreenView<TimedLoadingScreenViewModel, TimedLoadingScreenRouter> {

        let router = TimedLoadingScreenRouter(isPresented: route.isPresented)

        let interactor = TimedLoadingScreenInteractor(
            useCases: .init()
        )
        let viewModel = TimedLoadingScreenViewModel(
            interactor: interactor,
            title: route.title,
            description: route.description,
            time: route.time,
            destinationRoute: route.destinationRoute
        )
        let view = TimedLoadingScreenView(viewModel: viewModel, router: router)

        return view
    }
}
