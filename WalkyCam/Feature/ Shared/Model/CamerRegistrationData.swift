//
//  CamerRegistrationData.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 29/04/24.
//

import Foundation
import MapKit

struct CamerRegistrationData: Hashable {
    var id: String
    var name: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var earningType: String
    var preferredLocation: Coordinate
    var devicesTypes: [TechnologyType]
    var devicesInfo: [TechnologyInfo]
    var days: [AvailableDayInfo]
    
    public init(
        id: String = "",
        name: String = "",
        lastName: String = "",
        phoneNumber: String = "",
        email: String = "",
        earningType: String = "",
        preferredLocation: Coordinate = .init(),
        devicesTypes: [TechnologyType] = [],
        devicesInfo: [TechnologyInfo] = [],
        days: [AvailableDayInfo] = []
    ) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.earningType = earningType
        self.preferredLocation = preferredLocation
        self.devicesTypes = devicesTypes
        self.devicesInfo = devicesInfo
        self.days = days
    }
}

struct TechnologyInfo: Hashable {
    let type: TechnologyType
    let brand: String
    let model: String
    let serialNumber: String
        
    public init(
        type: TechnologyType = .none,
        brand: String = "",
        model: String = "",
        serialNumber: String = ""
    ) {
        self.type = type
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
    }
}

public enum TechnologyType {
    case none
    case lidar
    case smartphone
    case drone
    case videocamera
    case rov
    case camera360
    case scan
    case alcoholTest
    case thermalCamera
    case detectorMetales
    case detectorCables
    case eletricalAnalizer
    case print3d
    case robotDog
    
    var value: String {
        switch self {
        case .none:
            return ""
        case .lidar:
            return Asset.Icons.lidar.name
        case .smartphone:
            return Asset.Icons.smartphone.name
        case .drone:
            return Asset.Icons.drone.name
        case .videocamera:
            return Asset.Icons.camera.name
        case .rov:
            return Asset.Icons.rov.name
        case .camera360:
            return Asset.Icons._360Camera.name
        case .scan:
            return Asset.Icons.scan3D.name
        case .alcoholTest:
            return Asset.Icons.alcohol.name
        case .thermalCamera:
            return Asset.Icons.thermalCamera.name
        case .detectorMetales:
            return Asset.Icons.detectorMetales.name
        case .detectorCables:
            return Asset.Icons.analisadorRedes.name
        case .eletricalAnalizer:
            return Asset.Icons.cables.name
        case .print3d:
            return Asset.Icons._3dPrinting.name
        case .robotDog:
            return Asset.Icons.robotDog.name
        }
    }
}

public enum AbilityType {
    
}

struct AvailableDayInfo: Hashable {
    let name: String
    let primaryStartTime: String
    let primaryEndTime: String
    let secondaryStartTime: String
    let secondaryEndTime: String
}
