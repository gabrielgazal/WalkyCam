import SwiftUI
import StripePaymentSheet

final class PlansPagesViewModel: PlansPagesViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PlansPagesInteractorProtocol
    private let router: PlansPagesRouterProtocol

    @Published var currentPage: Int
    @Published var plans: [PlansPagesModel] = []
    @Published var isPaymentSheetLoading: Bool = false
    private var paymentId: String = ""
    private var subscriptionId: String = ""

    // MARK: - Stripe Dependencies

    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?

    // MARK: - Initialization

    init(
        interactor: PlansPagesInteractorProtocol,
        router: PlansPagesRouterProtocol,
        currentPage: Int
    ) {
        self.interactor = interactor
        self.router = router
        self.currentPage = currentPage
        initializePlans()
    }

    // MARK: - Public API

    @MainActor func preparePaymentSheet() async {
        isPaymentSheetLoading = true
        do {
            let index = currentPage < plans.count ? currentPage : 0
            let intent = try await interactor.createSubscriptionIntent(with: plans[index].title)
            STPAPIClient.shared.publishableKey = intent.publishableKey

            var configuration = PaymentSheet.Configuration()
            configuration.merchantDisplayName = "WalkyCam"
            configuration.customer = .init(id: intent.customerId,
                                           ephemeralKeySecret: intent.ephemeralKey)
            self.paymentSheet = PaymentSheet(paymentIntentClientSecret: intent.clientSecretId,
                                             configuration: configuration)
            self.paymentId = intent.paymentId
            self.subscriptionId = intent.subscriptionId
            isPaymentSheetLoading = false
        } catch {
            isPaymentSheetLoading = false
            print("Deu erro no pagamento")
        }
    }

    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
        if case .completed = result {
            self.paymentSheet = nil
            if let userId = try? UserSession().user().id  {
                isPaymentSheetLoading = true
                Task {
                    do {
                        let plan = plans[currentPage]
                        _ = try await interactor.createSubscription(userId: userId,
                                                                    planName: plan.title,
                                                                    planType: "monthly",
                                                                    paymentId: self.subscriptionId,
                                                                    subscriptionId: self.subscriptionId,
                                                                    amount: plan.monthlyPrice)
                        isPaymentSheetLoading = false
                        router.routeToHome()
                    } catch {
                        isPaymentSheetLoading = false
                        print("Erro")
                    }
                }
            }
        }
    }

    // MARK: - Private Methods

    private func initializePlans() {
        plans = PlansManager.shared.getPlansPagesModel()
    }
}
