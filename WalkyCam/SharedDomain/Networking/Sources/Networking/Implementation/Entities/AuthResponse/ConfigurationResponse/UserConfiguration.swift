//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/02/24.
//

import Foundation

public struct UserConfiguration: Codable, Hashable {
    public let onboardingReaded: Bool

    private enum CodingKeys: String, CodingKey {
        case onboardingReaded = "onboarding_readed"
    }
}

