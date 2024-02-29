//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation

public struct Scan3DConfigurationResponse: Codable, Hashable {
    public let configuration: UserConfiguration

    private enum CodingKeys: String, CodingKey {
        case configuration = "scan3d_user_configuration"
    }
}
