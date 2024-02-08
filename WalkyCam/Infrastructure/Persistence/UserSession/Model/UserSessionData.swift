//
//  UserSessionData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

import Foundation

struct UserSessionData: Hashable, Codable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let address: String
    public var configurations: Configurations?

    public struct Configurations: Hashable, Codable {
        public var streetCam: Bool
        public var scan3D: Bool
        public var videoCall: Bool
        public var ARHands: Bool
        public var digitalTwins: Bool
        public var drone: Bool
    }
}
