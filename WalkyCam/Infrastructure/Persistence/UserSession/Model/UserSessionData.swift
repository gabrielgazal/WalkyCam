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
    public var configurations: Configurations

    public struct Configurations: Hashable, Codable {
        public var streetCam: Bool
        public var scan3D: Bool
        public var videoCall: Bool
        public var ARHands: Bool
        public var digitalTwins: Bool
        public var drone: Bool

        public init(
            streetCam: Bool = false,
            scan3D: Bool = false,
            videoCall: Bool = false,
            ARHands: Bool = false,
            digitalTwins: Bool = false,
            drone: Bool = false
        ) {
            self.streetCam = streetCam
            self.scan3D = scan3D
            self.videoCall = videoCall
            self.ARHands = ARHands
            self.digitalTwins = digitalTwins
            self.drone = drone
        }
    }
}
