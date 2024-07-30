//
//  CammerData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 01/02/24.
//

import Foundation
import MapKit
import SwiftUI

struct CammerData: Hashable {
    let id: Int
    let name: String
    let stars: Int
    let description: String
    let about: String?
    let profileImage: String
    let technologies: [CammerTechnology]
    let coordinates: Coordinate
    let availability: AvailabilityInfo?
    let devices: [DevicesInfo]
    let abilities: [AbilityInfo]

    public init(
        id: Int,
        name: String,
        stars: Int,
        description: String,
        about: String? = nil,
        profileImage: String,
        technologies: [CammerTechnology],
        coordinates: Coordinate = .init(),
        devices: [DevicesInfo] = [],
        availability: AvailabilityInfo? = nil,
        abilities: [AbilityInfo] = []
    ) {
        self.id = id
        self.name = name
        self.stars = stars
        self.description = description
        self.about = about
        self.profileImage = profileImage
        self.devices = devices
        self.coordinates = coordinates
        self.technologies = technologies
        self.availability = availability
        self.abilities = abilities
    }
}

enum CammerTechnology: Int, CaseIterable {
    case drone = 0
    case scan
    case smartphone
    case camera
    case video
    
    func toIcon() -> String {
        switch self {
        case .drone:
            return Asset.Icons.drone.name
        case .scan:
            return Asset.Icons.scan3D.name
        case .smartphone:
            return Asset.DevicesIcons.smartphone.name
        case .camera:
            return Asset.DevicesIcons.camera.name
        case .video:
            return Asset.DevicesIcons.video.name
        }
    }
}

struct Coordinate: Hashable {
    let latitude: Double
    let longitude: Double

    public init(latitude: Double = 0.0,
                longitude: Double = 0.0) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

struct AvailabilityInfo: Hashable {
    let hourlyCost: Double
    let recordingTime: Double
    let availabilityTime: Double
}

struct DevicesInfo: Hashable {
    let name: String
    let type: CammerTechnology
}

struct AbilityInfo: Hashable {
    let name: String
    let icon: String
}
