//
//  FunctionData.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 26/10/23.
//

import Foundation

struct FunctionData: Hashable, Identifiable {
    let id: UUID = .init()
    let title: String
    let icon: String
}

enum FunctionType {
    case videocall
    case drone
    case scan3d
    case arhands
    case digitalTwins
    case streetcam
    case iot
    case print

    var convertedValue: FunctionData {
        switch self {
        case .videocall:
            return .init(title: "Video Call", icon: Asset.Icons.videoCall.name)
        case .drone:
            return .init(title: "Drone", icon: Asset.Icons.drone.name)
        case .scan3d:
            return .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name)
        case .arhands:
            return .init(title: "AR Hands", icon: Asset.Icons.ar.name)
        case .digitalTwins:
            return .init(title: "Digital Twins", icon: Asset.Icons.digitalTwins.name)
        case .streetcam:
            return .init(title: "Street Cam", icon: Asset.Icons.streetCam.name)
        case .iot:
            return .init(title: "IOT", icon: Asset.Icons.iot.name)
        case .print:
            return .init(title: "3D Print", icon: Asset.Icons._3dPrinting.name)
        }
    }
}
