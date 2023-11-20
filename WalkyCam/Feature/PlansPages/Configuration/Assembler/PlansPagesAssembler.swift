import SwiftUI

final class PlansPagesAssembler: PlansPagesAssemblerProtocol {
    func resolveView(
        route: PlansPagesRoute
    ) -> PlansPagesView<PlansPagesViewModel, PlansPagesRouter> {

        let router = PlansPagesRouter(isPresented: route.isPresented)

        let interactor = PlansPagesInteractor(
            useCases: .init()
        )
        let viewModel = PlansPagesViewModel(interactor: interactor, currentPage: route.currentPage)
        let view = PlansPagesView(viewModel: viewModel, router: router)

        return view
    }
}
