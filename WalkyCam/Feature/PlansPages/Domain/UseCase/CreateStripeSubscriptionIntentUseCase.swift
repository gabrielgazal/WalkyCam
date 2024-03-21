//
//  CreateStripeSubscriptionIntentUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 18/03/24.
//

import Foundation
import Networking
import Combine

typealias CreateStripeSubscriptionIntentUseCase = GenericUseCase<SubscriptionIntentInput, SubscriptionIntentOutput>

extension CreateStripeSubscriptionIntentUseCase {

    static func live(
        repository: PaymentRepositoryProtocol
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.createUserPayment(planName: input.planName.rawValue,
                                                 planType: input.planType.rawValue) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(mapResponseToResult(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func mapResponseToResult(_ data: ConfigurationIntentResponse) -> SubscriptionIntentOutput {
        return .init(subscriptionId: data.subscriptionId,
                     paymentId: data.paymentId,
                     clientSecretId: data.clientSecretId,
                     ephemeralKey: data.ephemeralKey,
                     customerId: data.customerId,
                     publishableKey: data.publishableKey)
    }
}
