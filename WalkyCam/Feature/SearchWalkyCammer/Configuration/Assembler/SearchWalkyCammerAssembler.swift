import SwiftUI

final class SearchWalkyCammerAssembler: SearchWalkyCammerAssemblerProtocol {
    func resolveView(
        route: SearchWalkyCammerRoute
    ) -> SearchWalkyCammerView<SearchWalkyCammerViewModel, SearchWalkyCammerRouter> {

        let router = SearchWalkyCammerRouter(isPresented: route.isPresented)

        let interactor = SearchWalkyCammerInteractor(
            useCases: .init()
        )
        let viewModel = SearchWalkyCammerViewModel(interactor: interactor)
        let view = SearchWalkyCammerView(viewModel: viewModel, router: router)

        return view
    }
}
