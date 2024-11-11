//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum Scan3DRouter {
    case startCreate(userId: String)
    case create(scan3dId: String)
    case startSchedule(userId: String)
    case update(scan3dId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool)
    case cancel(scan3dId: String)
    case schedule(scan3dId: String)
    
}

extension Scan3DRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }
    
    var path: String {
        switch self {
        case .startCreate:
            "scan3d/start-create"
        case .create:
            "scan3d/create"
        case .startSchedule:
            "scan3d/start-schedule"
        case .update:
            "scan3d/update"
        case .cancel:
            "scan3d/cancel"
        case .schedule:
            "scan3d/schedule"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .startCreate, .startSchedule:
            return .post
        case .create, .update, .cancel, .schedule:
            return .put
        }
    }
    
    var task: Task {
        switch self {
        case let .startCreate(userId):
            return startCreate(userId: userId)
        case let .create(scan3dId):
            return create(scan3dId: scan3dId)
        case let .startSchedule(userId):
            return startSchedule(userId: userId)
        case let .update(scan3dId, date, startTime, endTime, pixelationEnabled):
            return update(scan3dId: scan3dId, date: date, startTime: startTime, endTime: endTime, pixelationEnabled: pixelationEnabled)
        case let .cancel(scan3dId):
            return cancel(scan3dId: scan3dId)
        case let .schedule(scan3dId):
            return schedule(scan3dId: scan3dId)
        }
    }
    
    private func startCreate(userId: String) -> Task {
        let parameters = [
            "id_host_user": userId,
            "time_zone": TimeZone.current.identifier
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func create(scan3dId: String) -> Task {
        let parameters = [
            "id": scan3dId
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
        scan3dId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool
    ) -> Task {
        let parameters = [
            "id": scan3dId,
            "date": date,
            "start_time": startTime,
            "end_time": endTime,
            "pixelation_face_enabled": pixelationEnabled,
            "time_zone": TimeZone.current.identifier
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    
    private func cancel(scan3dId: String) -> Task {
        let parameters = [
            "id": scan3dId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
    
    private func schedule(scan3dId: String) -> Task {
        let parameters = [
            "id": scan3dId
        ] as [String: Any]
        
        return .requestParameters(parameters: parameters,
                                  encoding: JSONEncoding.default)
    }
}
