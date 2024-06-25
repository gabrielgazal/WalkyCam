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
        case "Georradar":
            return L10n.Tooltip.georradar
        case "Roto LIDAR Scan":
            return L10n.Tooltip.rotoLIDARScan
        case "R.O.V. Underwater Drone":
            return L10n.Tooltip.R.O.V.underwaterDrone
        case "Dog Robot":
            return L10n.Tooltip.dogRobot
        case "Robótica Telepresencia":
            return L10n.Tooltip.robóticaTelepresencia
        case "Robótica para Mascotas":
            return L10n.Tooltip.robóticaParaMascotas
        case "Ecografía":
            return L10n.Tooltip.ecografía
        case "Robótica":
            return L10n.Tooltip.robótica
        case "Detector de metales":
            return L10n.Tooltip.detectorDeMetales
        case "Detector de cables":
            return L10n.Tooltip.detectorDeCables
        case "Analizador de redes":
            return L10n.Tooltip.analizadorDeRedes
        case "Thermal Camara":
            return L10n.Tooltip.thermalCamara
        case "Link to CRM/ERP":
            return L10n.Tooltip.linkToCRMERP
        case "Digital Twin":
            return L10n.Tooltip.digitalTwin
        case "IOT applications & Data analysis":
            return L10n.Tooltip.iotApplicationsDataAnalysis
        case "Drone Fly":
            return L10n.Tooltip.droneFly
        case "IA & Data Analysis":
            return L10n.Tooltip.iaDataAnalysis
        case "NFT (Pictures)":
            return L10n.Tooltip.nftPictures
        case "CryptoWallet":
            return L10n.Tooltip.cryptoWallet
        case "Video Call: 200 Personas con duración ilimitada.":
            return L10n.Tooltip.videoCall200PersonasConDuraciónIlimitada
        case "Street Cam (WalkCamer)":
            return L10n.Tooltip.streetCamWalkCamer
        case "AR Hands":
            return L10n.Tooltip.arHands
        case "Scan 3D":
            return L10n.Tooltip.scan3D
        case "Pixelation Faces":
            return L10n.Tooltip.pixelationFaces
        case "360º Camera":
            return L10n.Tooltip._360ºCamera
        case "Certified Recording":
            return L10n.Tooltip.certifiedRecording
        case "Alcohol & Drug test":
            return L10n.Tooltip.alcoholDrugTest
        case "Juegos y otros":
            return L10n.Tooltip.juegosYOtros
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
        case .ruralDrone:
            return .init(title: "Drone", icon: Asset.Icons.riego.name)
        case .lidar:
            return .init(title: "LIDAR", icon: Asset.Icons.lidar.name)
        }
    }
}
