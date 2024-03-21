//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

final class SubscriptionRepository: SubscriptionRepositoryProtocol {
    // MARK: - Dependencies

    private let service: SubscriptionServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: SubscriptionServiceProtocol = SubscriptionService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler()
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func createSubscription(userId: String, planName: String, planType: String, paymentId: String, subscriptionId: String, amount: String, completion: @escaping (CreateSubscriptionResult) -> Void) {
        service.createSubscription(userId: userId,
                                   planName: planName,
                                   planType: planType,
                                   paymentId: paymentId,
                                   subscriptionId: subscriptionId,
                                   amount: amount) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
