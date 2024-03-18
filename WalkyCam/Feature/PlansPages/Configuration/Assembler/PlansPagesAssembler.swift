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
                        subscriptionId: "",
                        paymentId: "pi_3OvkRYLu5o3P18Zp1l0dH23F_secret_vwARJjKE7zdM1jCoy8WmA4VIq",
                        clientSecretId: "",
                        ephemeralKey: "ek_test_YWNjdF8xSHZUSTdMdTVvM1AxOFpwLDlFSlVNeXRBVUhnYWpmdll6Qk0zbEpEbktIZ0t4Mmg_00PN9hGwQU",
                        customerId: "cus_PlGzKdidY8uExM",
                        publishableKey: "pk_test_51HvTI7Lu5o3P18Zp6t5AgBSkMvWoTtA0nyA7pVYDqpfLkRtWun7qZTYCOHCReprfLM464yaBeF72UFfB7cY9WG4a00ZnDtiC2C"))
            )
        )
        let viewModel = PlansPagesViewModel(interactor: interactor, currentPage: route.currentPage)
        let view = PlansPagesView(viewModel: viewModel, router: router)

        return view
    }
}
