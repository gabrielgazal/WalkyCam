//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum SubscriptionRouter {
    case createSubscription(userId: String,
                            planName: String,
                            planType: String,
                            paymentId: String,
                            subscriptionId: String,
                            amount: String)
}

extension SubscriptionRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .createSubscription:
            return "subscription/create"
        }
    }

    var method: Moya.Method {
        switch self {
        case .createSubscription:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .createSubscription(userId, planName, planType, paymentId, subscriptionId, amount):
            return createSubscription(userId: userId,
                                      planName: planName,
                                      planType: planType,
                                      paymentId: paymentId,
                                      subscriptionId: subscriptionId,
                                      amount: amount)
        }
    }

    private func createSubscription(userId: String,
                                    planName: String,
                                    planType: String,
                                    paymentId: String,
                                    subscriptionId: String,
                                    amount: String) -> Task {
        let parameters = [
            "id_user": userId,
            "plan_name": planName,
            "plan_type": planType,
            "id_stripe_payment": paymentId,
            "id_stripe_subscription": subscriptionId,
            "amount": amount
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
