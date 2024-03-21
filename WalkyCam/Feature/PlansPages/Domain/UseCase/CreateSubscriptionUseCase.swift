//
//  CreteSubscriptionUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Foundation
import Networking
import Combine

typealias CreateSubscriptionUseCase = GenericUseCase<SubscriptionInput, Void>

extension CreateSubscriptionUseCase {

    static func live(
        repository: SubscriptionRepositoryProtocol
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.createSubscription(userId: input.userId,
                                                  planName: input.planName,
                                                  planType: input.planType,
                                                  paymentId: input.paymentId,
                                                  subscriptionId: input.subscriptionId,
                                                  amount: input.amount) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case .success:
                            promise(.success(()))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
