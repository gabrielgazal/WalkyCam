//
//  LoginOutput.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 27/01/24.
//

import Foundation

struct LoginOutput: Hashable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let address: String
    public let phone: String
    public let birthDate: String?
    public let gender: String?
    public let additionalInfo: String?
    public let isWalkCammer: Bool
    public let profileImage: String
    public let configurations: Configurations
    
    public struct Configurations: Hashable, Codable {
        public var streetcamConfiguration: Bool
        public var scan3dConfiguration: Bool
        public var videocallConfiguration: Bool
        public var arHandsConfiguration: Bool
        public var digitalTwinsConfiguration: Bool
        public var droneConfiguration: Bool
        public var droneIOTConfiguration: Bool
        public var print3dConfiguration: Bool
    }
}
