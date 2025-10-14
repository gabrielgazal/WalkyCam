//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum WalkcamerRouter {
    case convertUser(WalkcamerConvertUserRequest)
    case updateAvailability(userId: String)
    case getNearWalkcammers(lat: CGFloat, lon: CGFloat)
    case searchWalkcammer(input: String)
    
}

extension WalkcamerRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .convertUser:
            return "walkcamer/convert-user-to-walkcamer"
        case .updateAvailability:
            return "walkcamer/convert-user-to-walkcamer"
        case let .getNearWalkcammers(lat, lon):
            return "walkcamer/get-near-walkcamers/\(lat)/\(lon)"
        case let .searchWalkcammer(input):
            return "walkcamer/search/\(input)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .convertUser, .updateAvailability:
            return .post
        case .getNearWalkcammers, .searchWalkcammer:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .convertUser(requestModel):
            return .requestJSONEncodable(requestModel)
        case let .updateAvailability(userId):
            return updateAvailability(userId: userId)
        case .getNearWalkcammers, .searchWalkcammer:
            return .requestPlain
        }
    }
    
    private func updateAvailability(userId: String) -> Task {
        let parameters = [
            "id_user": userId
        ] as [String:Any]
        
        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
