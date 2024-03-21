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
        StripeAPI.defaultPublishableKey = "pk_live_51Oa1qPC7VBHgFZD8SKs64YNs4GG0u0OUFTlN6itQvdQGcCmmrnc9hCasDFMvWethf0CUYcsPmaGhCHA338UvNARU00vR9oc1w2"
    }
}
