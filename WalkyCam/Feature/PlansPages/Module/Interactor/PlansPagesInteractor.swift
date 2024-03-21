import Combine

final class PlansPagesInteractor: PlansPagesInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let createSubscriptionIntent: CreateStripeSubscriptionIntentUseCase
        let createSubscription: CreateSubscriptionUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func createSubscriptionIntent(with plan: String) async throws -> SubscriptionIntentOutput {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.createSubscriptionIntent(.init(planName: SubscriptionIntentInput.PlanName(rawValue: plan) ?? .basic,
                                                    planType: .monthly))
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { user in
                    continuation.resume(returning: user)
                }
            )
            .store(in: &bag)
        }
    }

    func createSubscription(userId: String,
                            planName: String,
                            planType: String,
                            paymentId: String,
                            subscriptionId: String,
                            amount: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.createSubscription(
                .init(
                    userId: userId,
                    planName: planName,
                    planType: planType,
                    paymentId: paymentId,
                    subscriptionId: subscriptionId,
                    amount: amount
                )
            )
            .sink(
                receiveCompletion:  { completion in
                    switch completion {
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    case .finished:
                        break
                    }
                },
                receiveValue: { _ in
                    continuation.resume()
                }
            )
            .store(in: &bag)
        }
    }
}
