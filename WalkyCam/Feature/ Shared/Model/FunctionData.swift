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

extension FunctionData {
    func getTooltipText() -> String {
        switch self.title {
        case "Video Call":
            return L10n.Tooltip.videoCall
        case "AR Hands":
            return L10n.Tooltip.asistenciaRemota
        case "Scan 3D":
            return L10n.Tooltip.scan3D
        case "Pixelation Faces":
            return L10n.Tooltip.pixelationFaces
        case "Juegos y otros":
            return L10n.Tooltip.games
        case "Street Cam (WalkCamer)":
            return L10n.Tooltip.streetCam
        case "360º Camera":
            return L10n.Tooltip.camara360
        case "Certified Recording":
            return L10n.Tooltip.certifiedRecording
        case "3D Printer":
            return L10n.Tooltip.print3D
        case "IOT applications & Data analysis":
            return L10n.Tooltip.iot
        case "Digital Twin":
            return L10n.Tooltip.digitalTwins
        case "Drone Fly":
            return L10n.Tooltip.droneFly
        case "IA & Data analysis":
            return L10n.Tooltip.iaDataAnalysis
        case "Alcohol & Drug test":
            return L10n.Tooltip.alcoholDrugTest
        case "NFT (Pictures)":
            return L10n.Tooltip.nft
        case "CriptoWallet":
            return L10n.Tooltip.cryptoWallet
        case "Georradas":
            return L10n.Tooltip.georadar
        case "Roto LIDAR Scan":
            return L10n.Tooltip.lidar
        case "R.O.V. Underwater Drone":
            return L10n.Tooltip.rovDrone
        case "Detector de cables":
            return L10n.Tooltip.detectorCables
        case "Analizador de redes":
            return L10n.Tooltip.analizadorDeRedes
        case "Thermal Camera":
            return L10n.Tooltip.thermalCamera
        case "Link to CRM/ERP":
            return L10n.Tooltip.crm
        case "Engineering & Lawyer (Consulting only)":
            return L10n.Tooltip.engineering
        case "Backpack Screen advertising":
            return L10n.Tooltip.backPackScreenADversiting
        case "Detector de Metales":
            return L10n.Tooltip.detectorMetales
        case "Dog Robot":
            return L10n.Tooltip.dogRobot
        case "Robótica Telepresencia":
            return L10n.Tooltip.robóticaTelepresencia
        case "Robótica para Mascotas":
            return L10n.Tooltip.robóticaMascotas
        case "IA & Data Analysis":
            return L10n.Tooltip.iaDataAnalysis
        case "Georradar":
            return L10n.Tooltip.georadar
        case "Thermal Camara":
            return L10n.Tooltip.thermalCamera
        case "Ecografía":
            return L10n.Tooltip.ecografía
        case "Detector de metales":
            return L10n.Tooltip.detectorMetales
        default:
            return ""
        }
    }
}

enum FunctionType: String {
    case videocall = "videocall"
    case drone = "drone"
    case ruralDrone = "ruralDrone"
    case lidar = "lidar"
    case scan3d = "scan3d"
    case arhands = "arhands"
    case digitalTwins = "digitalTwins"
    case streetcam = "streetcam"
    case iot = "iot"
    case print = "print"
    case thermalCamera = "thermalCamera"
    
    var convertedValue: FunctionData {
        switch self {
        case .videocall:
            return .init(title: "Videollamada", icon: Asset.Icons.videoCall.name)
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
        case .ruralDrone:
            return .init(title: "Drone", icon: Asset.Icons.riego.name)
        case .lidar:
            return .init(title: "LIDAR", icon: Asset.Icons.lidar.name)
        case .thermalCamera:
            return .init(title: "Thermal Camera", icon: Asset.Icons.thermalCamera.name)
        }
    }
}
