//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Foundation
import Moya

enum PaymentRouter {
    case createUserPayment(userId: String)
}

extension PaymentRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .createUserPayment:
            return "user-payment/create)"
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
        case let .createUserPayment(userId):
            return createUserPayment(userId)
        }
    }

    // MARK: - Private Methods

    private func createUserPayment(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
