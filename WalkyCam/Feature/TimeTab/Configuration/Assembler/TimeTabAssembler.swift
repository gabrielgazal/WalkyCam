import SwiftUI

final class TimeTabAssembler: TimeTabAssemblerProtocol {
    func resolveView(
        route: TimeTabRoute
    ) -> TimeTabView<TimeTabViewModel, TimeTabRouter> {

        let router = TimeTabRouter(isPresented: route.isPresented)

        let interactor = TimeTabInteractor(
            useCases: .init()
        )
        let viewModel = TimeTabViewModel(interactor: interactor)
        let view = TimeTabView(viewModel: viewModel, router: router)

        return view
    }
}
