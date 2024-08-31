//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum ConfigurationRouter {
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
        case .updateStreetCamConfiguration:
            return "user/update-streetcam-configuration"
        case .updateScan3DConfiguration:
            return "user/update-scan3d-configuration"
        case .updateVideoCallConfiguration:
            return "user/update-videocall-configuration"
        case .updateARHandsConfiguration:
            return "user/update-arhands-configuration"
        case .updateDigitalTwinsCamConfiguration:
            return "user/update-digital-twins-configuration"
        case .updateDroneConfiguration:
            return "user/update-drone-configuration"
        }
    }

    var method: Moya.Method {
        switch self {
        case .updateStreetCamConfiguration, .updateScan3DConfiguration, .updateVideoCallConfiguration, .updateARHandsConfiguration, .updateDigitalTwinsCamConfiguration, .updateDroneConfiguration:
            return .put
        }
    }

    var task: Task {
        switch self {
        case let .updateStreetCamConfiguration(userId):
            return updateStreetCamConfiguration(userId)
        case let .updateScan3DConfiguration(userId):
            return updateScan3DConfiguration(userId)
        case let .updateVideoCallConfiguration(userId):
            return updateVideoCallConfiguration(userId)
        case let .updateARHandsConfiguration(userId):
            return updateARHandsConfiguration(userId)
        case let .updateDigitalTwinsCamConfiguration(userId):
            return updateDigitalTwinsCamConfiguration(userId)
        case let .updateDroneConfiguration(userId):
            return updateDroneConfiguration(userId)
        }
    }

    // MARK: - Private Methods

    private func updateStreetCamConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true,
            "pixelation_terms_accepted": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }

    private func updateScan3DConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
    
    private func updateVideoCallConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true,
            "pixelation_terms_accepted": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
    
    private func updateARHandsConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
    
    private func updateDigitalTwinsCamConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
    
    private func updateDroneConfiguration(_ userId: String) -> Task {
        let parameters = [
            "id_user": userId,
            "onboarding_readed": true,
            "terms_accepted": true
        ] as [String:Any]

        return .requestParameters(
            parameters: parameters,
            encoding: JSONEncoding.default
        )
    }
}
