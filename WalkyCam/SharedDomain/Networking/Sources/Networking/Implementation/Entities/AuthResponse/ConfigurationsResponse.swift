//
//  ConfigurationsResponse.swift
//
//
//  Created by Gabriel Gazal on 25/06/24.
//

import Foundation

public struct ConfigurationsResponse: Codable, Hashable {
    public let streetcamConfiguration: UserConfiguration
    public let scan3dConfiguration: UserConfiguration
    public let videocallConfiguration: UserConfiguration
    public let arHandsConfiguration: UserConfiguration
    public let digitalTwinsConfiguration: UserConfiguration
    public let droneConfiguration: UserConfiguration
    public let droneIOTConfiguration: UserConfiguration
    public let print3dConfiguration: UserConfiguration

    private enum CodingKeys: String, CodingKey {
        case streetcamConfiguration = "streetcam_configuration"
        case scan3dConfiguration = "scan3d_configuration"
        case videocallConfiguration = "videocall_configuration"
        case arHandsConfiguration = "arhands_configuration"
        case digitalTwinsConfiguration = "digital_twins_configuration"
        case droneConfiguration = "drone_configuration"
        case droneIOTConfiguration = "drone_iot_configuration"
        case print3dConfiguration = "print_3d_configuration"
    }
}
