//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum PlansRouter {
    case getAllPlans
    case getPlanById(id: String)
}

extension PlansRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .getAllPlans:
            return "plan/get-all"
        case let .getPlanById(id):
            return "plan/get-by-id/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getAllPlans, .getPlanById:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getAllPlans, .getPlanById:
            return .requestPlain
        }
    }
}
