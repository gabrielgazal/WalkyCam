import SwiftUI

final class WalkyCammerListAssembler: WalkyCammerListAssemblerProtocol {
    func resolveView(
        route: WalkyCammerListRoute
    ) -> WalkyCammerListView<WalkyCammerListViewModel, WalkyCammerListRouter> {

        let router = WalkyCammerListRouter(isPresented: route.isPresented)

        let interactor = WalkyCammerListInteractor(
            useCases: .init()
        )
        let viewModel = WalkyCammerListViewModel(interactor: interactor)
        let view = WalkyCammerListView(viewModel: viewModel, router: router)

        return view
    }
}
