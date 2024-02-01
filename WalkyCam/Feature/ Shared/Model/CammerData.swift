//
//  CammerData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 01/02/24.
//

import Foundation
import MapKit

struct CammerData: Hashable {
    let id: Int
    let name: String
    let stars: Int
    let description: String
    let profileImage: String
    let technologies: [CammerTechnology]
    let coordinates: Coordinate

    public init(
        id: Int,
        name: String,
        stars: Int,
        description: String,
        profileImage: String,
        technologies: [CammerTechnology],
        coordinates: Coordinate = .init()
    ) {
        self.id = id
        self.name = name
        self.stars = stars
        self.description = description
        self.profileImage = profileImage
        self.technologies = technologies
        self.coordinates = coordinates
    }
}

enum CammerTechnology: Int, CaseIterable {
    case drone = 0
    case scan
    case smartphone
    case camera
    case video
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
