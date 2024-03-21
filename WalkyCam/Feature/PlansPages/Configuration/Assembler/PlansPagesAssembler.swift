import SwiftUI
import Networking

final class PlansPagesAssembler: PlansPagesAssemblerProtocol {
    func resolveView(
        route: PlansPagesRoute
    ) -> PlansPagesView<PlansPagesViewModel, PlansPagesRouter> {

        let router = PlansPagesRouter(isPresented: route.isPresented)

        let paymentRepository = route.retailRepository.resolve(PaymentRepositoryProtocol.self)
        let subscriptionRepository = route.retailRepository.resolve(SubscriptionRepositoryProtocol.self)

        let interactor = PlansPagesInteractor(
            useCases: .init(
                createSubscriptionIntent: .live(repository: paymentRepository),
                createSubscription: .live(repository: subscriptionRepository)
            )
        )
        let viewModel = PlansPagesViewModel(interactor: interactor,
                                            router: router,
                                            currentPage: route.currentPage)
        let view = PlansPagesView(viewModel: viewModel, router: router)

        return view
    }
}
