protocol PlansPagesInteractorProtocol {
    func createSubscriptionIntent(with plan: String) async throws -> SubscriptionIntentOutput
}
