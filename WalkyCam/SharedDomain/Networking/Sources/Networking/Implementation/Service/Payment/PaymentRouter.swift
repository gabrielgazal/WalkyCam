//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Foundation
import Moya

enum PaymentRouter {
    case createUserPayment(planName: String, planType: String)
}

extension PaymentRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .createUserPayment:
            return "payment/create-subscription-intent"
        }
    }

    var method: Moya.Method {
        switch self {
        case .createUserPayment:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .createUserPayment(planName, planType):
            return createUserPayment(planName, planType)
        }
    }

    // MARK: - Private Methods

    private func createUserPayment(_ planName: String, _ planType: String) -> Task {
        let parameters = [
            "plan_name": planName,
            "plan_type": planType
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
