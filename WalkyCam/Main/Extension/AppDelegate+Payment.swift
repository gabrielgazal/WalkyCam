//
//  AppDelegate+Payment.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 18/03/24.
//

import Foundation
import StripeCore

extension AppDelegate {
    func initializePaymentSDK() {
        StripeAPI.defaultPublishableKey = "testKey"
    }
}
