protocol PlansPagesInteractorProtocol {
    func createSubscriptionIntent(with plan: String) async throws -> SubscriptionIntentOutput
    func createSubscription(userId: String,
                            planName: String,
                            planType: String,
                            paymentId: String,
                            subscriptionId: String,
                            amount: String) async throws -> Void
}
