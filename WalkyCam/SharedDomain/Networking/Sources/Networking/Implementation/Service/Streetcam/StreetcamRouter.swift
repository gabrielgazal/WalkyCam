//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum StreetcamRouter {
    case startCreate(userId: String)
    case create(streetcamId: String)
    case startSchedule(userId: String)
    case update(streetcamId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                timeZone: String)
    case cancel(streetcamId: String)
    case schedule(streetcamId: String)
    
}

extension StreetcamRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .startCreate:
            "streetcam/start-create"
        case .create:
            "streetcam/create"
        case .startSchedule:
            "streetcam/start-schedule"
        case .update:
            "streetcam/update"
        case .cancel:
            "streetcam/cancel"
        case .schedule:
            "videocall/schedule"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .startCreate, .create, .startSchedule, .update, .cancel, .schedule:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .startCreate(userId):
            return startCreate(userId: userId)
        case let .create(streetcamId):
            return create(streetcamId: streetcamId)
        case let .startSchedule(userId):
            return startSchedule(userId: userId)
        case let .update(streetcamId, date, startTime, endTime, pixelationEnabled, timeZone):
            return update(streetcamId: streetcamId, date: date, startTime: startTime, endTime: endTime, pixelationEnabled: pixelationEnabled, timeZone: timeZone)
        case let .cancel(streetcamId):
            return cancel(streetcamId: streetcamId)
        case let .schedule(streetcamId):
            return schedule(streetcamId: streetcamId)
        }
    }
    
    private func startCreate(userId: String) -> Task {
        let parameters = [
            "id_host_user": userId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func create(streetcamId: String) -> Task {
        let parameters = [
            "id": streetcamId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func startSchedule(userId: String) -> Task {
        let parameters = [
            "id_host_user": userId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func update(
        streetcamId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        timeZone: String
    ) -> Task {
        let parameters = [
            "id": streetcamId,
            "date": date,
            "start_time": startTime,
            "end_time": endTime,
            "pixelation_face_enabled": pixelationEnabled,
            "time_zone": timeZone
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    
    private func cancel(streetcamId: String) -> Task {
        let parameters = [
            "id": streetcamId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func schedule(streetcamId: String) -> Task {
        let parameters = [
            "id": streetcamId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
}
