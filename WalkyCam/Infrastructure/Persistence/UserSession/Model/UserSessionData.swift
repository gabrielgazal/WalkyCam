//
//  UserSessionData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

import Foundation

struct UserSessionData: Hashable, Codable {
    public var id: String
    public var userName: String
    public var name: String
    public var lastName: String
    public var email: String
    public var address: String
    public var phone: String
    public var birthDate: String?
    public var gender: String?
    public var additionalInfo: String
    public var isWalkCamer: Bool
    public var configurations: Configurations
    public var plan: PlanData
    public var profileImageURL: String?

    public struct Configurations: Hashable, Codable {
        public var streetcamConfiguration: Bool
        public var scan3dConfiguration: Bool
        public var videocallConfiguration: Bool
        public var arHandsConfiguration: Bool
        public var digitalTwinsConfiguration: Bool
        public var droneConfiguration: Bool
        public var droneIOTConfiguration: Bool
        public var print3dConfiguration: Bool
             
        public init(
            streetcamConfiguration: Bool = false,
            scan3dConfiguration: Bool = false,
            videocallConfiguration: Bool = false,
            arHandsConfiguration: Bool = false,
            digitalTwinsConfiguration: Bool = false,
            droneConfiguration: Bool = false,
            droneIOTConfiguration: Bool = false,
            print3dConfiguration: Bool = false
        ) {
            self.streetcamConfiguration = streetcamConfiguration
            self.scan3dConfiguration = scan3dConfiguration
            self.videocallConfiguration = videocallConfiguration
            self.arHandsConfiguration = arHandsConfiguration
            self.digitalTwinsConfiguration = digitalTwinsConfiguration
            self.droneConfiguration = droneConfiguration
            self.droneIOTConfiguration = droneIOTConfiguration
            self.print3dConfiguration = print3dConfiguration
        }
    }
    
    public struct PlanData: Hashable, Codable {
        public var id: String
        public var name: String
        
        public init(id: String = "",
                    name: String = "")
        {
            self.id = id
            self.name = name
        }
    }
}
