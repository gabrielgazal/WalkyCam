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
        public let streetCam: Bool
        public let scan3D: Bool
        public let videoCall: Bool
        public let ARHands: Bool
        public let digitalTwins: Bool
        public let drone: Bool
    }
}
