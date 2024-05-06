//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum WalkcamerRouter {
    case convertUser(userId: String,
                     phoneNumber: String,
                     earningType: String,
                     preferredLatitude: String,
                     preferredLongitude: String,
                     rovsInfo: [String],
                     smartphonesInfo: [String],
                     diveInfo: [String],
                     driveInfo: [String],
                     days: [String])
    case updateAvailability(userId: String)
    
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
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .convertUser, .updateAvailability:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .convertUser(userId,
                              phoneNumber,
                              earningType,
                              preferredLatitude,
                              preferredLongitude,
                              rovsInfo,
                              smartphonesInfo,
                              diveInfo,
                              driveInfo,
                              days):
            return convertUser(
                userId: userId,
                phoneNumber: phoneNumber,
                earningType: earningType,
                preferredLatitude: preferredLatitude,
                preferredLongitude: preferredLongitude,
                rovsInfo: rovsInfo,
                smartphonesInfo: smartphonesInfo,
                diveInfo: diveInfo,
                driveInfo: driveInfo,
                days: days
            )
        case let .updateAvailability(userId):
            return updateAvailability(userId: userId)
        }
    }
    
    private func convertUser(userId: String,
                             phoneNumber: String,
                             earningType: String,
                             preferredLatitude: String,
                             preferredLongitude: String,
                             rovsInfo: [String],
                             smartphonesInfo: [String],
                             diveInfo: [String],
                             driveInfo: [String],
                             days: [String]) -> Task {
        let parameters = [
            "id_user": userId,
            "cellphone_number": phoneNumber,
            "earning_type": earningType,
            "preferred_location_latitude": preferredLatitude,
            "preferred_location_longitude": preferredLongitude,
            "rovs_info": rovsInfo,
            "smartphones_info": smartphonesInfo,
            "dive_info": diveInfo,
            "drive_info": driveInfo,
            "days": days
        ] as [String:Any]
        
        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
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
