//
//  CamerRegistrationData.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 29/04/24.
//

import Foundation
import MapKit

struct CamerRegistrationData: Hashable {
    var id: Int
    var name: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var earningType: String
    var preferredLocation: Coordinate
    var rovInfo: [TechnologyInfo]
    var smartphonesInfo: [TechnologyInfo]
    var diveInfo: [TechnologyInfo]
    var driveInfo: [TechnologyInfo]
    var days: [AvailableDayInfo]
    
    public init(
        id: Int = 0,
        name: String = "",
        lastName: String = "",
        phoneNumber: String = "",
        email: String = "",
        earningType: String = "",
        preferredLocation: Coordinate = .init(),
        rovInfo: [TechnologyInfo] = [],
        smartphonesInfo: [TechnologyInfo] = [],
        diveInfo: [TechnologyInfo] = [],
        driveInfo: [TechnologyInfo] = [],
        days: [AvailableDayInfo] = []
    ) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.earningType = earningType
        self.preferredLocation = preferredLocation
        self.rovInfo = rovInfo
        self.smartphonesInfo = smartphonesInfo
        self.diveInfo = diveInfo
        self.driveInfo = driveInfo
        self.days = days
    }
}

struct TechnologyInfo: Hashable {
    let brand: String
    let model: String
    let serialNumber: String
}

struct AvailableDayInfo: Hashable {
    let name: String
    let primaryStartTime: String
    let primaryEndTime: String
    let secondaryStartTime: String
    let secondaryEndTime: String
}
