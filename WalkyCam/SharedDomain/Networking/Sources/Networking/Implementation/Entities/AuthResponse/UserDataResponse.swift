//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 24/03/24.
//

import Foundation

public struct UserDataResponse: Codable, Hashable {
    public let user: UserResponse
    public let token: String
    public let streetCamConfiguration: UserConfiguration
    public let scan3dConfiguration: UserConfiguration
    public let videoCallConfiguration: UserConfiguration
    public let arHandsConfiguration: UserConfiguration
    public let digitalTwinsConfiguration: UserConfiguration
    public let droneCamConfiguration: UserConfiguration
    public let print3dConfiguration: UserConfiguration

    private enum CodingKeys: String, CodingKey {
        case user, token
        case streetCamConfiguration = "streetcam_user_configuration"
        case scan3dConfiguration = "scan3d_user_configuration"
        case videoCallConfiguration = "videocall_user_configuration"
        case arHandsConfiguration = "arhands_user_configuration"
        case digitalTwinsConfiguration = "digital_twins_user_configuration"
        case droneCamConfiguration = "drone_user_configuration"
        case print3dConfiguration = "print_3d_user_configuration"
    }
}
