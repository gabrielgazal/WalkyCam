//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation

public struct ConfigurationResponse: Codable, Hashable {
    public let configuration: UserConfiguration

    private enum CodingKeys: String, CodingKey {
        case configuration = "user_configuration"
    }

    public struct UserConfiguration: Codable, Hashable {
        public let onboardingReaded: Bool

        private enum CodingKeys: String, CodingKey {
            case onboardingReaded = "onboarding_readed"
        }
    }
}
