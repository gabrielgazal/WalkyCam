//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct ConfigurationIntentResponse: Codable, Hashable {
    public let subscriptionId: String
    public let paymentId: String
    public let clientSecretId: String
    public let ephemeralKey: String
    public let customerId: String
    public let publishableKey: String

    private enum CodingKeys: String, CodingKey {
        case subscriptionId = "id_stripe_subscription"
        case paymentId = "id_stripe_payment"
        case clientSecretId = "subscripcion_client_secret"
        case ephemeralKey = "ephemeral_key"
        case customerId = "customer"
        case publishableKey = "publishable_key"

    }
}
