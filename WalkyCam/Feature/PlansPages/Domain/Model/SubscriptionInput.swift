//
//  SubscriptionInput.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Foundation

struct SubscriptionInput: Hashable {
    let userId: String
    let planName: String
    let planType: String
    let paymentId: String
    let subscriptionId: String
    let amount: String
}
