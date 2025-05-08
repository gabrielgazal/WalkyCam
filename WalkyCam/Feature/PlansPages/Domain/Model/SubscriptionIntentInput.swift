//
//  SubscriptionIntentInput.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 18/03/24.
//

import Foundation

struct SubscriptionIntentInput: Hashable {
    let planName: PlanName
    let planType: PlanType

    enum PlanName: String {
        case free, vip, pro, business, premium
    }

    enum PlanType: String {
        case monthly, yearly
    }
}
