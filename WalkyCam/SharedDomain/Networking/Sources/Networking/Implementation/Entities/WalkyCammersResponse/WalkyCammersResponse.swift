//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Foundation

public struct WalkyCammersResponse: Codable, Hashable {
    public let id: String
    public let name: String
    public let lastName: String
    public let walkycamerInfo: WalkycammerInfo
    public let earningType: String

    private enum CodingKeys: String, CodingKey {
        case id, name
        case lastName = "last_name"
        case walkycamerInfo = "walkcamer_info"
        case earningType = "earning_type"
    }
}

public struct WalkycammerInfo: Codable, Hashable {
    public let availability: Bool
    public let preferredLocation: PreferredLocation
    
    private enum CodingKeys: String, CodingKey {
        case availability
        case preferredLocation = "preferred_location"
    }
}

public struct PreferredLocation: Codable, Hashable {
    public let type: String
    public let coordinates: [Double]
    
    private enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}
