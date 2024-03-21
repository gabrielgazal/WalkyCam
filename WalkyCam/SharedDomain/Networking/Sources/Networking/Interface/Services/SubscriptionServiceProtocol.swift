//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Combine
import Moya
import Foundation

protocol SubscriptionServiceProtocol {
    func createSubscription(userId: String,
                            planName: String,
                            planType: String,
                            paymentId: String,
                            subscriptionId: String,
                            amount: String,
                            completion: @escaping Completion)
}
