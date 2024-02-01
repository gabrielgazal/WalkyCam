//
//  CammerData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 01/02/24.
//

import Foundation

struct CammerData: Hashable {
    let id: Int
    let name: String
    let stars: Int
    let description: String
    let profileImage: String
    let technologies: [CammerTechnology]
}

enum CammerTechnology: Int, CaseIterable {
    case drone = 0
    case scan
    case smartphone
    case camera
    case video
}
