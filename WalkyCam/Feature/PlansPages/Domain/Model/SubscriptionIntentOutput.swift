//
//  SubscriptionIntentModel.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 18/03/24.
//

import Foundation


public struct SubscriptionIntentOutput: Codable, Hashable {
    public let subscriptionId: String
    public let paymentId: String
    public let clientSecretId: String
    public let ephemeralKey: String
    public let customerId: String
    public let publishableKey: String
}
