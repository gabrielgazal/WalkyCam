//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum VideoCallRouter {
    case create(userId: String)
    case startSchedule(userId: String)
    case update(callId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool)
    case cancel(callId: String)
    case schedule(callId: String)
    
}

extension VideoCallRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .create:
            "videocall/create"
        case .startSchedule:
            "videocall/start-schedule"
        case .update:
            "videocall/update"
        case .cancel:
            "videocall/cancel"
        case .schedule:
            "videocall/schedule"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .create, .startSchedule, .update, .cancel, .schedule:
                .post
        }
    }
    
    var task: Task {
        switch self {
        case let .create(userId):
            return create(userId: userId)
        case let .startSchedule(userId):
            return startSchedule(userId: userId)
        case let .update(callId, date, startTime, endTime, pixelationEnabled):
            return update(callId: callId, date: date, startTime: startTime, endTime: endTime, pixelationEnabled: pixelationEnabled)
        case let .cancel(callId):
            return cancel(callId: callId)
        case let .schedule(callId):
            return schedule(callId: callId)
        }
    }
    
    private func create(userId: String) -> Task {
        let parameters = [
            "id_host_user": userId,
            "time_zone": TimeZone.current.identifier
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func startSchedule(userId: String) -> Task {
        let parameters = [
            "id_host_user": userId,
            "time_zone": TimeZone.current.identifier
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func update(
        callId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool
    ) -> Task {
        let parameters = [
            "id": callId,
            "date": date,
            "start_time": startTime,
            "end_time": endTime,
            "pixelation_face_enabled": pixelationEnabled,
            "time_zone": TimeZone.current.identifier
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    
    private func cancel(callId: String) -> Task {
        let parameters = [
            "id": callId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func schedule(callId: String) -> Task {
        let parameters = [
            "id": callId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
}
