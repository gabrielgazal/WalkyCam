import SwiftUI
import Networking

final class PlansPagesAssembler: PlansPagesAssemblerProtocol {
    func resolveView(
        route: PlansPagesRoute
    ) -> PlansPagesView<PlansPagesViewModel, PlansPagesRouter> {

        let router = PlansPagesRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(PaymentRepositoryProtocol.self)

        let interactor = PlansPagesInteractor(
            useCases: .init(
                createSubscriptionIntent: .live(repository: repository)
            )
        )
        let viewModel = PlansPagesViewModel(interactor: interactor, currentPage: route.currentPage)
        let view = PlansPagesView(viewModel: viewModel, router: router)

        return view
    }
}
