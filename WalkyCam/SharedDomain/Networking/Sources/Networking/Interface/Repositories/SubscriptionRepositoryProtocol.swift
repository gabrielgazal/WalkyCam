//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Foundation

public protocol SubscriptionRepositoryProtocol {
    typealias CreateSubscriptionResult = Result<Void, RepositoryError>

    func createSubscription(userId: String,
                            planName: String,
                            planType: String,
                            paymentId: String,
                            subscriptionId: String,
                            amount: String,
                            completion: @escaping (CreateSubscriptionResult) -> Void)
}
