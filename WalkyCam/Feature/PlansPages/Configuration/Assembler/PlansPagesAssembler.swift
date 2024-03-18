import SwiftUI

final class PlansPagesAssembler: PlansPagesAssemblerProtocol {
    func resolveView(
        route: PlansPagesRoute
    ) -> PlansPagesView<PlansPagesViewModel, PlansPagesRouter> {

        let router = PlansPagesRouter(isPresented: route.isPresented)

        let interactor = PlansPagesInteractor(
            useCases: .init(
                createSubscriptionIntent: .static(
                    .init(
                        subscriptionId: "sub_1OvlqsC7VBHgFZD8fkPOeNs3",
                        paymentId: "pi_3OvlqsC7VBHgFZD813gZMVE2",
                        clientSecretId: "pi_3OvlqsC7VBHgFZD813gZMVE2_secret_YO1lq1Sxwk8h0Ib1TAuk2b03W",
                        ephemeralKey: "ek_test_YWNjdF8xT2ExcVBDN1ZCSGdGWkQ4LHlaTjJpZ0FqZUtOQ1BveXR3WFVnT3puS29zVEdiU2M_00cldbRPu0",
                        customerId: "cus_PlIRvgnvQJtTPP",
                        publishableKey: "pk_test_51Oa1qPC7VBHgFZD8VkiKL91qPF63BTifASyDKmbpthytBNKYFLOacGxgqwyzauB9tDixilxlFKcMoxtRtWwtrJqg00zqBs78PH"))
            )
        )
        let viewModel = PlansPagesViewModel(interactor: interactor, currentPage: route.currentPage)
        let view = PlansPagesView(viewModel: viewModel, router: router)

        return view
    }
}
