//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum ConfigurationRouter {
    case getStreetCamConfiguration(userId: String)
    case getScan3DConfiguration(userId: String)
    case getVideoCallConfiguration(userId: String)
    case getARHandsConfiguration(userId: String)
    case getDigitalTwinsCamConfiguration(userId: String)
    case getDroneConfiguration(userId: String)
    case updateStreetCamConfiguration(userId: String)
    case updateScan3DConfiguration(userId: String)
    case updateVideoCallConfiguration(userId: String)
    case updateARHandsConfiguration(userId: String)
    case updateDigitalTwinsCamConfiguration(userId: String)
    case updateDroneConfiguration(userId: String)
}

extension ConfigurationRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case let .getStreetCamConfiguration(userId):
            return "get-street-cam-configuration/\(userId)"
        case let .getScan3DConfiguration(userId):
            return "get-scan3d-configuration/\(userId)"
        case let .getVideoCallConfiguration(userId):
            return "get-videocall-configuration/\(userId)"
        case let .getARHandsConfiguration(userId):
            return "get-arhands-configuration/\(userId)"
        case let .getDigitalTwinsCamConfiguration(userId):
            return "get-digital-twins-configuration/\(userId)"
        case let .getDroneConfiguration(userId):
            return "get-drone-configuration/\(userId)"
        case .updateStreetCamConfiguration:
            return "update-street-cam-configuration"
        case .updateScan3DConfiguration:
            return "update-scan3d-configuration"
        case .updateVideoCallConfiguration:
            return "update-videocall-configuration"
        case .updateARHandsConfiguration:
            return "update-arhands-configuration"
        case .updateDigitalTwinsCamConfiguration:
            return "update-digital-twins-configuration"
        case .updateDroneConfiguration:
            return "update-drone-configuration"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getStreetCamConfiguration, .getScan3DConfiguration, .getVideoCallConfiguration, .getARHandsConfiguration, .getDigitalTwinsCamConfiguration, .getDroneConfiguration:
            return .get
        case .updateStreetCamConfiguration, .updateScan3DConfiguration, .updateVideoCallConfiguration, .updateARHandsConfiguration, .updateDigitalTwinsCamConfiguration, .updateDroneConfiguration:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .getStreetCamConfiguration, .getScan3DConfiguration, .getVideoCallConfiguration, .getARHandsConfiguration, .getDigitalTwinsCamConfiguration, .getDroneConfiguration:
            return .requestPlain
        case let .updateStreetCamConfiguration(userId):
            return updateConfiguration(userId)
        case let .updateScan3DConfiguration(userId):
            return updateConfiguration(userId)
        case let .updateVideoCallConfiguration(userId):
            return updateConfiguration(userId)
        case let .updateARHandsConfiguration(userId):
            return updateConfiguration(userId)
        case let .updateDigitalTwinsCamConfiguration(userId):
            return updateConfiguration(userId)
        case let .updateDroneConfiguration(userId):
            return updateConfiguration(userId)
        }
    }

    // MARK: - Private Methods

    private func updateConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }

}
