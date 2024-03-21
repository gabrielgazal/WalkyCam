//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class SubscriptionService: SubscriptionServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<SubscriptionRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<SubscriptionRouter>) {
        self.provider = provider
    }

    // MARK: - Public API

    func createSubscription(userId: String, planName: String, planType: String, paymentId: String, subscriptionId: String, amount: String, completion: @escaping Completion) {
        provider.request(.createSubscription(userId: userId,
                                             planName: planName,
                                             planType: planType,
                                             paymentId: paymentId,
                                             subscriptionId: subscriptionId,
                                             amount: amount),
                         completion: completion)
    }
}
