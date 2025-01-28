// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Ads {
    internal static let beach = ImageAsset(name: "beach")
    internal static let iphone = ImageAsset(name: "iphone")
    internal static let planeTravel = ImageAsset(name: "planeTravel")
    internal static let premium1 = ImageAsset(name: "premium-1")
    internal static let premium2 = ImageAsset(name: "premium-2")
    internal static let premium3 = ImageAsset(name: "premium-3")
    internal static let premium4 = ImageAsset(name: "premium-4")
    internal static let premium5 = ImageAsset(name: "premium-5")
    internal static let search = ImageAsset(name: "search")
  }
  internal enum Banners {
    internal enum AnalisadorRedes {
      internal static let analisador1 = ImageAsset(name: "Analisador1")
      internal static let analisador10 = ImageAsset(name: "Analisador10")
      internal static let analisador11 = ImageAsset(name: "Analisador11")
      internal static let analisador12 = ImageAsset(name: "Analisador12")
      internal static let analisador13 = ImageAsset(name: "Analisador13")
      internal static let analisador14 = ImageAsset(name: "Analisador14")
      internal static let analisador15 = ImageAsset(name: "Analisador15")
      internal static let analisador16 = ImageAsset(name: "Analisador16")
      internal static let analisador17 = ImageAsset(name: "Analisador17")
      internal static let analisador18 = ImageAsset(name: "Analisador18")
      internal static let analisador19 = ImageAsset(name: "Analisador19")
      internal static let analisador2 = ImageAsset(name: "Analisador2")
      internal static let analisador20 = ImageAsset(name: "Analisador20")
      internal static let analisador3 = ImageAsset(name: "Analisador3")
      internal static let analisador4 = ImageAsset(name: "Analisador4")
      internal static let analisador5 = ImageAsset(name: "Analisador5")
      internal static let analisador6 = ImageAsset(name: "Analisador6")
      internal static let analisador7 = ImageAsset(name: "Analisador7")
      internal static let analisador8 = ImageAsset(name: "Analisador8")
      internal static let analisador9 = ImageAsset(name: "Analisador9")
    }
    internal enum AppleWatchSimulator {
      internal static let watch1 = ImageAsset(name: "watch1")
      internal static let watch2 = ImageAsset(name: "watch2")
      internal static let watch3 = ImageAsset(name: "watch3")
      internal static let watch4 = ImageAsset(name: "watch4")
      internal static let watch5 = ImageAsset(name: "watch5")
      internal static let watch6 = ImageAsset(name: "watch6")
    }
    internal enum BackpackScreenAd {
      internal static let backpackScreenAd1 = ImageAsset(name: "BackpackScreenAd1")
      internal static let backpackScreenAd10 = ImageAsset(name: "BackpackScreenAd10")
      internal static let backpackScreenAd11 = ImageAsset(name: "BackpackScreenAd11")
      internal static let backpackScreenAd12 = ImageAsset(name: "BackpackScreenAd12")
      internal static let backpackScreenAd13 = ImageAsset(name: "BackpackScreenAd13")
      internal static let backpackScreenAd14 = ImageAsset(name: "BackpackScreenAd14")
      internal static let backpackScreenAd15 = ImageAsset(name: "BackpackScreenAd15")
      internal static let backpackScreenAd16 = ImageAsset(name: "BackpackScreenAd16")
      internal static let backpackScreenAd17 = ImageAsset(name: "BackpackScreenAd17")
      internal static let backpackScreenAd18 = ImageAsset(name: "BackpackScreenAd18")
      internal static let backpackScreenAd19 = ImageAsset(name: "BackpackScreenAd19")
      internal static let backpackScreenAd2 = ImageAsset(name: "BackpackScreenAd2")
      internal static let backpackScreenAd20 = ImageAsset(name: "BackpackScreenAd20")
      internal static let backpackScreenAd3 = ImageAsset(name: "BackpackScreenAd3")
      internal static let backpackScreenAd4 = ImageAsset(name: "BackpackScreenAd4")
      internal static let backpackScreenAd5 = ImageAsset(name: "BackpackScreenAd5")
      internal static let backpackScreenAd6 = ImageAsset(name: "BackpackScreenAd6")
      internal static let backpackScreenAd7 = ImageAsset(name: "BackpackScreenAd7")
      internal static let backpackScreenAd8 = ImageAsset(name: "BackpackScreenAd8")
      internal static let backpackScreenAd9 = ImageAsset(name: "BackpackScreenAd9")
    }
    internal enum Crm {
      internal static let crm1 = ImageAsset(name: "CRM1")
      internal static let crm2 = ImageAsset(name: "CRM2")
      internal static let crm3 = ImageAsset(name: "CRM3")
      internal static let crm4 = ImageAsset(name: "CRM4")
      internal static let crm5 = ImageAsset(name: "CRM5")
      internal static let crm6 = ImageAsset(name: "CRM6")
    }
    internal enum Camera360 {
      internal static let camera3601 = ImageAsset(name: "Camera360_1")
      internal static let camera36010 = ImageAsset(name: "Camera360_10")
      internal static let camera36011 = ImageAsset(name: "Camera360_11")
      internal static let camera36012 = ImageAsset(name: "Camera360_12")
      internal static let camera36013 = ImageAsset(name: "Camera360_13")
      internal static let camera36014 = ImageAsset(name: "Camera360_14")
      internal static let camera36015 = ImageAsset(name: "Camera360_15")
      internal static let camera36016 = ImageAsset(name: "Camera360_16")
      internal static let camera36017 = ImageAsset(name: "Camera360_17")
      internal static let camera36018 = ImageAsset(name: "Camera360_18")
      internal static let camera36019 = ImageAsset(name: "Camera360_19")
      internal static let camera3602 = ImageAsset(name: "Camera360_2")
      internal static let camera36020 = ImageAsset(name: "Camera360_20")
      internal static let camera36021 = ImageAsset(name: "Camera360_21")
      internal static let camera36022 = ImageAsset(name: "Camera360_22")
      internal static let camera36023 = ImageAsset(name: "Camera360_23")
      internal static let camera3603 = ImageAsset(name: "Camera360_3")
      internal static let camera3604 = ImageAsset(name: "Camera360_4")
      internal static let camera3605 = ImageAsset(name: "Camera360_5")
      internal static let camera3606 = ImageAsset(name: "Camera360_6")
      internal static let camera3607 = ImageAsset(name: "Camera360_7")
      internal static let camera3608 = ImageAsset(name: "Camera360_8")
      internal static let camera3609 = ImageAsset(name: "Camera360_9")
    }
    internal enum CertifiedRecording {
      internal static let _321CertifiedRecordingOnboarding1 = ImageAsset(name: "32.1 Certified recording _ Onboarding 1")
      internal static let _3210CertifiedRecordingDetallesDelServicio = ImageAsset(name: "32.10 Certified recording _ Detalles del servicio")
      internal static let _3211VideollamadaRegistradaConExito = ImageAsset(name: "32.11 Videollamada registrada con exito")
      internal static let _3212PublicidadTiempo = ImageAsset(name: "32.12 Publicidad tiempo")
      internal static let _3213CertifiedRecordingInvitacion = ImageAsset(name: "32.13 Certified recording _ invitacion")
      internal static let _3214CertifiedRecordingVideollmada1 = ImageAsset(name: "32.14 Certified recording _ videollmada 1")
      internal static let _3215CertifiedRecordingTransmisionGrabacion = ImageAsset(name: "32.15 Certified recording _ transmision grabacion")
      internal static let _3216CertifiedRecordingVideollamadaGrabacion = ImageAsset(name: "32.16 Certified recording _ videollamada grabacion")
      internal static let _3217CertifiedRecordingInvitacionAVideoCertificado = ImageAsset(name: "32.17 Certified recording _ invitacion a video certificado")
      internal static let _3218CertifiedRecordingCertificacion = ImageAsset(name: "32.18 Certified recording _ Certificacion")
      internal static let _322CertifiedRecordingOnboarding2 = ImageAsset(name: "32.2 Certified recording _ Onboarding 2")
      internal static let _323CertifiedRecordingOnboardingPixelado = ImageAsset(name: "32.3 Certified recording _ Onboarding pixelado")
      internal static let _324CertifiedRecordingBuscarYReservar = ImageAsset(name: "32.4 Certified recording _ Buscar y reservar")
      internal static let _325CertifiedRecordingBuscarZona = ImageAsset(name: "32.5 Certified recording _ Buscar zona")
      internal static let _326CertifiedRecordingWalkCamersDisponiblesMapa = ImageAsset(name: "32.6 Certified recording _ WalkCamers disponibles mapa")
      internal static let _327CertifiedRecordingWalkCamersDisponiblesLista = ImageAsset(name: "32.7 Certified recording _ WalkCamers disponibles lista")
      internal static let _328CertifiedRecordingWalkCamer = ImageAsset(name: "32.8 Certified recording _ WalkCamer")
      internal static let _329CertifiedRecordingAgregarPersonas = ImageAsset(name: "32.9 Certified recording _ Agregar personas")
    }
    internal enum Consulting {
      internal static let consulting1 = ImageAsset(name: "Consulting1")
      internal static let consulting10 = ImageAsset(name: "Consulting10")
      internal static let consulting11 = ImageAsset(name: "Consulting11")
      internal static let consulting12 = ImageAsset(name: "Consulting12")
      internal static let consulting13 = ImageAsset(name: "Consulting13")
      internal static let consulting14 = ImageAsset(name: "Consulting14")
      internal static let consulting2 = ImageAsset(name: "Consulting2")
      internal static let consulting3 = ImageAsset(name: "Consulting3")
      internal static let consulting4 = ImageAsset(name: "Consulting4")
      internal static let consulting5 = ImageAsset(name: "Consulting5")
      internal static let consulting6 = ImageAsset(name: "Consulting6")
      internal static let consulting7 = ImageAsset(name: "Consulting7")
      internal static let consulting8 = ImageAsset(name: "Consulting8")
      internal static let consulting9 = ImageAsset(name: "Consulting9")
    }
    internal enum DetectorCables {
      internal static let detectorCables1 = ImageAsset(name: "DetectorCables1")
      internal static let detectorCables10 = ImageAsset(name: "DetectorCables10")
      internal static let detectorCables11 = ImageAsset(name: "DetectorCables11")
      internal static let detectorCables12 = ImageAsset(name: "DetectorCables12")
      internal static let detectorCables13 = ImageAsset(name: "DetectorCables13")
      internal static let detectorCables14 = ImageAsset(name: "DetectorCables14")
      internal static let detectorCables15 = ImageAsset(name: "DetectorCables15")
      internal static let detectorCables16 = ImageAsset(name: "DetectorCables16")
      internal static let detectorCables17 = ImageAsset(name: "DetectorCables17")
      internal static let detectorCables18 = ImageAsset(name: "DetectorCables18")
      internal static let detectorCables19 = ImageAsset(name: "DetectorCables19")
      internal static let detectorCables2 = ImageAsset(name: "DetectorCables2")
      internal static let detectorCables3 = ImageAsset(name: "DetectorCables3")
      internal static let detectorCables4 = ImageAsset(name: "DetectorCables4")
      internal static let detectorCables5 = ImageAsset(name: "DetectorCables5")
      internal static let detectorCables6 = ImageAsset(name: "DetectorCables6")
      internal static let detectorCables7 = ImageAsset(name: "DetectorCables7")
      internal static let detectorCables8 = ImageAsset(name: "DetectorCables8")
      internal static let detectorCables9 = ImageAsset(name: "DetectorCables9")
    }
    internal enum DetectorMetales {
      internal static let detectorMetales1 = ImageAsset(name: "DetectorMetales1")
      internal static let detectorMetales10 = ImageAsset(name: "DetectorMetales10")
      internal static let detectorMetales11 = ImageAsset(name: "DetectorMetales11")
      internal static let detectorMetales12 = ImageAsset(name: "DetectorMetales12")
      internal static let detectorMetales13 = ImageAsset(name: "DetectorMetales13")
      internal static let detectorMetales14 = ImageAsset(name: "DetectorMetales14")
      internal static let detectorMetales15 = ImageAsset(name: "DetectorMetales15")
      internal static let detectorMetales16 = ImageAsset(name: "DetectorMetales16")
      internal static let detectorMetales17 = ImageAsset(name: "DetectorMetales17")
      internal static let detectorMetales2 = ImageAsset(name: "DetectorMetales2")
      internal static let detectorMetales3 = ImageAsset(name: "DetectorMetales3")
      internal static let detectorMetales4 = ImageAsset(name: "DetectorMetales4")
      internal static let detectorMetales5 = ImageAsset(name: "DetectorMetales5")
      internal static let detectorMetales6 = ImageAsset(name: "DetectorMetales6")
      internal static let detectorMetales7 = ImageAsset(name: "DetectorMetales7")
      internal static let detectorMetales8 = ImageAsset(name: "DetectorMetales8")
      internal static let detectorMetales9 = ImageAsset(name: "DetectorMetales9")
    }
    internal enum DogRobot {
      internal static let dogRobot1 = ImageAsset(name: "DogRobot1")
      internal static let dogRobot10 = ImageAsset(name: "DogRobot10")
      internal static let dogRobot11 = ImageAsset(name: "DogRobot11")
      internal static let dogRobot12 = ImageAsset(name: "DogRobot12")
      internal static let dogRobot13 = ImageAsset(name: "DogRobot13")
      internal static let dogRobot14 = ImageAsset(name: "DogRobot14")
      internal static let dogRobot15 = ImageAsset(name: "DogRobot15")
      internal static let dogRobot16 = ImageAsset(name: "DogRobot16")
      internal static let dogRobot17 = ImageAsset(name: "DogRobot17")
      internal static let dogRobot18 = ImageAsset(name: "DogRobot18")
      internal static let dogRobot19 = ImageAsset(name: "DogRobot19")
      internal static let dogRobot2 = ImageAsset(name: "DogRobot2")
      internal static let dogRobot3 = ImageAsset(name: "DogRobot3")
      internal static let dogRobot4 = ImageAsset(name: "DogRobot4")
      internal static let dogRobot5 = ImageAsset(name: "DogRobot5")
      internal static let dogRobot6 = ImageAsset(name: "DogRobot6")
      internal static let dogRobot7 = ImageAsset(name: "DogRobot7")
      internal static let dogRobot8 = ImageAsset(name: "DogRobot8")
      internal static let dogRobot9 = ImageAsset(name: "DogRobot9")
    }
    internal enum DrugTest {
      internal static let drugTest1 = ImageAsset(name: "DrugTest1")
      internal static let drugTest10 = ImageAsset(name: "DrugTest10")
      internal static let drugTest11 = ImageAsset(name: "DrugTest11")
      internal static let drugTest12 = ImageAsset(name: "DrugTest12")
      internal static let drugTest13 = ImageAsset(name: "DrugTest13")
      internal static let drugTest14 = ImageAsset(name: "DrugTest14")
      internal static let drugTest15 = ImageAsset(name: "DrugTest15")
      internal static let drugTest16 = ImageAsset(name: "DrugTest16")
      internal static let drugTest17 = ImageAsset(name: "DrugTest17")
      internal static let drugTest2 = ImageAsset(name: "DrugTest2")
      internal static let drugTest3 = ImageAsset(name: "DrugTest3")
      internal static let drugTest4 = ImageAsset(name: "DrugTest4")
      internal static let drugTest5 = ImageAsset(name: "DrugTest5")
      internal static let drugTest6 = ImageAsset(name: "DrugTest6")
      internal static let drugTest7 = ImageAsset(name: "DrugTest7")
      internal static let drugTest8 = ImageAsset(name: "DrugTest8")
      internal static let drugTest9 = ImageAsset(name: "DrugTest9")
    }
    internal enum Ecografia {
      internal static let ecografia1 = ImageAsset(name: "Ecografia1")
      internal static let ecografia10 = ImageAsset(name: "Ecografia10")
      internal static let ecografia11 = ImageAsset(name: "Ecografia11")
      internal static let ecografia12 = ImageAsset(name: "Ecografia12")
      internal static let ecografia13 = ImageAsset(name: "Ecografia13")
      internal static let ecografia14 = ImageAsset(name: "Ecografia14")
      internal static let ecografia15 = ImageAsset(name: "Ecografia15")
      internal static let ecografia16 = ImageAsset(name: "Ecografia16")
      internal static let ecografia2 = ImageAsset(name: "Ecografia2")
      internal static let ecografia3 = ImageAsset(name: "Ecografia3")
      internal static let ecografia4 = ImageAsset(name: "Ecografia4")
      internal static let ecografia5 = ImageAsset(name: "Ecografia5")
      internal static let ecografia6 = ImageAsset(name: "Ecografia6")
      internal static let ecografia7 = ImageAsset(name: "Ecografia7")
      internal static let ecografia8 = ImageAsset(name: "Ecografia8")
      internal static let ecografia9 = ImageAsset(name: "Ecografia9")
    }
    internal enum Georadar {
      internal static let georadar10 = ImageAsset(name: "Georadar10")
      internal static let georadar11 = ImageAsset(name: "Georadar11")
      internal static let georadar12 = ImageAsset(name: "Georadar12")
      internal static let georadar13 = ImageAsset(name: "Georadar13")
      internal static let georadar14 = ImageAsset(name: "Georadar14")
      internal static let georadar15 = ImageAsset(name: "Georadar15")
      internal static let georadar16 = ImageAsset(name: "Georadar16")
      internal static let georadar17 = ImageAsset(name: "Georadar17")
      internal static let georadar18 = ImageAsset(name: "Georadar18")
      internal static let georadar19 = ImageAsset(name: "Georadar19")
      internal static let georadar2 = ImageAsset(name: "Georadar2")
      internal static let georadar20 = ImageAsset(name: "Georadar20")
      internal static let georadar3 = ImageAsset(name: "Georadar3")
      internal static let georadar4 = ImageAsset(name: "Georadar4")
      internal static let georadar5 = ImageAsset(name: "Georadar5")
      internal static let georadar6 = ImageAsset(name: "Georadar6")
      internal static let georadar7 = ImageAsset(name: "Georadar7")
      internal static let georadar8 = ImageAsset(name: "Georadar8")
      internal static let georadar9 = ImageAsset(name: "Georadar9")
    }
    internal enum LawConsulting {
      internal static let lawConsulting1 = ImageAsset(name: "LawConsulting1")
      internal static let lawConsulting10 = ImageAsset(name: "LawConsulting10")
      internal static let lawConsulting11 = ImageAsset(name: "LawConsulting11")
      internal static let lawConsulting12 = ImageAsset(name: "LawConsulting12")
      internal static let lawConsulting13 = ImageAsset(name: "LawConsulting13")
      internal static let lawConsulting2 = ImageAsset(name: "LawConsulting2")
      internal static let lawConsulting3 = ImageAsset(name: "LawConsulting3")
      internal static let lawConsulting4 = ImageAsset(name: "LawConsulting4")
      internal static let lawConsulting5 = ImageAsset(name: "LawConsulting5")
      internal static let lawConsulting6 = ImageAsset(name: "LawConsulting6")
      internal static let lawConsulting7 = ImageAsset(name: "LawConsulting7")
      internal static let lawConsulting8 = ImageAsset(name: "LawConsulting8")
      internal static let lawConsulting9 = ImageAsset(name: "LawConsulting9")
    }
    internal enum Mascot {
      internal static let mascot1 = ImageAsset(name: "Mascot1")
      internal static let mascot2 = ImageAsset(name: "Mascot2")
      internal static let mascot3 = ImageAsset(name: "Mascot3")
    }
    internal enum Nft {
      internal static let nft1 = ImageAsset(name: "NFT1")
      internal static let nft2 = ImageAsset(name: "NFT2")
      internal static let nft3 = ImageAsset(name: "NFT3")
      internal static let nft4 = ImageAsset(name: "NFT4")
      internal static let nft5 = ImageAsset(name: "NFT5")
      internal static let nft6 = ImageAsset(name: "NFT6")
      internal static let nft7 = ImageAsset(name: "NFT7")
      internal static let nft8 = ImageAsset(name: "NFT8")
      internal static let nft9 = ImageAsset(name: "NFT9")
    }
    internal enum Rov {
      internal static let rov1 = ImageAsset(name: "R.O.V.1")
      internal static let rov10 = ImageAsset(name: "R.O.V.10")
      internal static let rov11 = ImageAsset(name: "R.O.V.11")
      internal static let rov12 = ImageAsset(name: "R.O.V.12")
      internal static let rov13 = ImageAsset(name: "R.O.V.13")
      internal static let rov14 = ImageAsset(name: "R.O.V.14")
      internal static let rov15 = ImageAsset(name: "R.O.V.15")
      internal static let rov16 = ImageAsset(name: "R.O.V.16")
      internal static let rov17 = ImageAsset(name: "R.O.V.17")
      internal static let rov18 = ImageAsset(name: "R.O.V.18")
      internal static let rov19 = ImageAsset(name: "R.O.V.19")
      internal static let rov2 = ImageAsset(name: "R.O.V.2")
      internal static let rov20 = ImageAsset(name: "R.O.V.20")
      internal static let rov21 = ImageAsset(name: "R.O.V.21")
      internal static let rov3 = ImageAsset(name: "R.O.V.3")
      internal static let rov4 = ImageAsset(name: "R.O.V.4")
      internal static let rov5 = ImageAsset(name: "R.O.V.5")
      internal static let rov6 = ImageAsset(name: "R.O.V.6")
      internal static let rov7 = ImageAsset(name: "R.O.V.7")
      internal static let rov8 = ImageAsset(name: "R.O.V.8")
      internal static let rov9 = ImageAsset(name: "R.O.V.9")
    }
    internal enum Recording {
      internal static let recording1 = ImageAsset(name: "Recording1")
      internal static let recording10 = ImageAsset(name: "Recording10")
      internal static let recording11 = ImageAsset(name: "Recording11")
      internal static let recording12 = ImageAsset(name: "Recording12")
      internal static let recording13 = ImageAsset(name: "Recording13")
      internal static let recording14 = ImageAsset(name: "Recording14")
      internal static let recording15 = ImageAsset(name: "Recording15")
      internal static let recording16 = ImageAsset(name: "Recording16")
      internal static let recording17 = ImageAsset(name: "Recording17")
      internal static let recording18 = ImageAsset(name: "Recording18")
      internal static let recording2 = ImageAsset(name: "Recording2")
      internal static let recording3 = ImageAsset(name: "Recording3")
      internal static let recording4 = ImageAsset(name: "Recording4")
      internal static let recording5 = ImageAsset(name: "Recording5")
      internal static let recording6 = ImageAsset(name: "Recording6")
      internal static let recording7 = ImageAsset(name: "Recording7")
      internal static let recording8 = ImageAsset(name: "Recording8")
      internal static let recording9 = ImageAsset(name: "Recording9")
    }
    internal enum Telepresence {
      internal static let telepresence1 = ImageAsset(name: "Telepresence1")
      internal static let telepresence2 = ImageAsset(name: "Telepresence2")
      internal static let telepresence3 = ImageAsset(name: "Telepresence3")
    }
  }
  internal enum DevicesIcons {
    internal static let camera = ImageAsset(name: "camera")
    internal static let smartphone2 = ImageAsset(name: "smartphone-2")
    internal static let video = ImageAsset(name: "video")
  }
  internal enum Fondos {
    internal static let digitalTwinsfondo = ImageAsset(name: "digitalTwinsfondo")
    internal static let droneFondo = ImageAsset(name: "drone_fondo")
    internal static let loginFondo = ImageAsset(name: "login_fondo")
    internal static let planFondo = ImageAsset(name: "plan_fondo")
    internal static let videocallFondo = ImageAsset(name: "videocall_fondo")
    internal static let watchBackground = ImageAsset(name: "watchBackground")
  }
  internal enum Icons {
    internal static let _360Camera = ImageAsset(name: "360Camera")
    internal static let _3dPrinting = ImageAsset(name: "3dPrinting")
    internal static let aiAnalysis = ImageAsset(name: "AIAnalysis")
    internal static let ar = ImageAsset(name: "AR")
    internal static let add = ImageAsset(name: "Add")
    internal static let agriculture = ImageAsset(name: "Agriculture")
    internal static let art = ImageAsset(name: "Art")
    internal static let building = ImageAsset(name: "Building")
    internal static let camera = ImageAsset(name: "Camera")
    internal static let compare = ImageAsset(name: "Compare")
    internal static let cryptocurrency = ImageAsset(name: "Cryptocurrency")
    internal static let derechosDeAutor = ImageAsset(name: "Derechos de autor")
    internal static let drone = ImageAsset(name: "Drone")
    internal static let farming = ImageAsset(name: "Farming")
    internal static let files = ImageAsset(name: "Files")
    internal static let filmMaker = ImageAsset(name: "Film maker")
    internal static let filter = ImageAsset(name: "Filter")
    internal static let fitnessWatch = ImageAsset(name: "Fitness Watch")
    internal static let fleet = ImageAsset(name: "Fleet")
    internal static let frame1584 = ImageAsset(name: "Frame 1584")
    internal static let gymkhana = ImageAsset(name: "Gymkhana")
    internal static let health = ImageAsset(name: "Health")
    internal static let industrial = ImageAsset(name: "Industrial")
    internal static let industry = ImageAsset(name: "Industry")
    internal static let karaoke2 = ImageAsset(name: "Karaoke 2")
    internal static let karaoke = ImageAsset(name: "Karaoke")
    internal static let lentes = ImageAsset(name: "LENTES")
    internal static let link = ImageAsset(name: "Link")
    internal static let location = ImageAsset(name: "Location")
    internal static let lock = ImageAsset(name: "Lock $")
    internal static let mariachis2 = ImageAsset(name: "Mariachis 2")
    internal static let music = ImageAsset(name: "Music")
    internal static let notes = ImageAsset(name: "Notes")
    internal static let personalShopper = ImageAsset(name: "PERSONAL SHOPPER")
    internal static let patenteDeInvencion = ImageAsset(name: "Patente de invencion")
    internal static let productos = ImageAsset(name: "Productos")
    internal static let qrcode = ImageAsset(name: "Qrcode")
    internal static let recent = ImageAsset(name: "Recent")
    internal static let retail = ImageAsset(name: "Retail")
    internal static let riego = ImageAsset(name: "Riego")
    internal static let scan3D = ImageAsset(name: "Scan3D")
    internal static let scapeRoom = ImageAsset(name: "Scape Room")
    internal static let settings = ImageAsset(name: "Settings")
    internal static let share = ImageAsset(name: "Share")
    internal static let shop = ImageAsset(name: "Shop")
    internal static let smartCity = ImageAsset(name: "SmartCity")
    internal static let smartHome = ImageAsset(name: "SmartHome")
    internal static let streetCam = ImageAsset(name: "Street Cam")
    internal static let surpriseBox = ImageAsset(name: "Surprise Box")
    internal static let tShirt = ImageAsset(name: "T-Shirt")
    internal static let toolCamera = ImageAsset(name: "Tool camera")
    internal static let uploadFolder = ImageAsset(name: "Upload Folder")
    internal static let usd = ImageAsset(name: "Usd")
    internal static let videoCall = ImageAsset(name: "VideoCall")
    internal static let accionesDetalle = ImageAsset(name: "acciones detalle")
    internal static let alcohol = ImageAsset(name: "alcohol")
    internal static let analisadorRedes = ImageAsset(name: "analisadorRedes")
    internal static let backpack = ImageAsset(name: "backpack")
    internal static let blueCheckmark = ImageAsset(name: "blueCheckmark")
    internal static let cables = ImageAsset(name: "cables")
    internal static let calendar = ImageAsset(name: "calendar")
    internal static let camerScan = ImageAsset(name: "camer+scan")
    internal static let cash = ImageAsset(name: "cash")
    internal static let check = ImageAsset(name: "check")
    internal static let checkmark = ImageAsset(name: "checkmark")
    internal static let copy = ImageAsset(name: "copy")
    internal static let crm = ImageAsset(name: "crm")
    internal static let crypto = ImageAsset(name: "crypto")
    internal static let danger = ImageAsset(name: "danger")
    internal static let detectorMetales = ImageAsset(name: "detectorMetales")
    internal static let digitalTwins = ImageAsset(name: "digitalTwins")
    internal static let ecografia = ImageAsset(name: "ecografia")
    internal static let edit = ImageAsset(name: "edit")
    internal static let engineering = ImageAsset(name: "engineering")
    internal static let externalHands = ImageAsset(name: "externalHands")
    internal static let eyeDisabledIcon = ImageAsset(name: "eyeDisabledIcon")
    internal static let eyeIcon = ImageAsset(name: "eyeIcon")
    internal static let funciones = ImageAsset(name: "funciones")
    internal static let games = ImageAsset(name: "games")
    internal static let glasses = ImageAsset(name: "glasses")
    internal static let hair = ImageAsset(name: "hair")
    internal static let heart = ImageAsset(name: "heart")
    internal static let identity = ImageAsset(name: "identity")
    internal static let images = ImageAsset(name: "images")
    internal static let iot = ImageAsset(name: "iot")
    internal static let joinMeet = ImageAsset(name: "joinMeet")
    internal static let lawyer = ImageAsset(name: "lawyer")
    internal static let lidar = ImageAsset(name: "lidar")
    internal static let locationWhite = ImageAsset(name: "locationWhite")
    internal static let mail = ImageAsset(name: "mail")
    internal static let market = ImageAsset(name: "market")
    internal static let mascotas = ImageAsset(name: "mascotas")
    internal static let messageCircle = ImageAsset(name: "message-circle")
    internal static let newspaper = ImageAsset(name: "newspaper")
    internal static let nft = ImageAsset(name: "nft")
    internal static let nftCoin = ImageAsset(name: "nftCoin")
    internal static let orangeShare = ImageAsset(name: "orangeShare")
    internal static let patenteDeIdea = ImageAsset(name: "patente de idea")
    internal static let pi = ImageAsset(name: "pi")
    internal static let pixelation = ImageAsset(name: "pixelation")
    internal static let plane = ImageAsset(name: "plane")
    internal static let playBusiness = ImageAsset(name: "playBusiness")
    internal static let radar = ImageAsset(name: "radar")
    internal static let rc2 = ImageAsset(name: "rc2")
    internal static let reload = ImageAsset(name: "reload")
    internal static let rgb = ImageAsset(name: "rgb")
    internal static let robotW = ImageAsset(name: "robot-w")
    internal static let robotDog = ImageAsset(name: "robotDog")
    internal static let robotica = ImageAsset(name: "robotica")
    internal static let rov = ImageAsset(name: "rov")
    internal static let sendIcon = ImageAsset(name: "sendIcon")
    internal static let shareGrid = ImageAsset(name: "shareGrid")
    internal static let smartphone = ImageAsset(name: "smartphone")
    internal static let smileFace = ImageAsset(name: "smileFace")
    internal static let socialsGrid = ImageAsset(name: "socialsGrid")
    internal static let soundwave = ImageAsset(name: "soundwave")
    internal static let telepresencia = ImageAsset(name: "telepresencia")
    internal static let thermalCamera = ImageAsset(name: "thermalCamera")
    internal static let translate = ImageAsset(name: "translate")
    internal static let videos = ImageAsset(name: "videos")
    internal static let wIcon = ImageAsset(name: "wIcon")
    internal static let walkybot = ImageAsset(name: "walkybot")
    internal static let walkycamerHands = ImageAsset(name: "walkycamerHands")
    internal static let workFromHome = ImageAsset(name: "work from home")
  }
  internal enum Illustrations {
    internal static let _3dModelingRafiki1 = ImageAsset(name: "3d modeling-rafiki 1")
    internal static let asistenteRemoto = ImageAsset(name: "Asistente Remoto")
    internal static let cropMonitoringViaMobileDevice = ImageAsset(name: "Crop monitoring via mobile device")
    internal static let dt1Onboarding = ImageAsset(name: "DT1_onboarding")
    internal static let dt2OnboardingPdf = ImageAsset(name: "DT2_onboarding.pdf")
    internal static let dataExtractionPana1 = ImageAsset(name: "Data extraction-pana 1")
    internal static let farmerUsingSmartFarmApplication = ImageAsset(name: "Farmer using smart farm application")
    internal static let farmingUsingAutonomousCultivator = ImageAsset(name: "Farming using autonomous Cultivator")
    internal static let group449 = ImageAsset(name: "Group 449")
    internal static let innovationPana1 = ImageAsset(name: "Innovation-pana 1")
    internal static let asistenteMenu = ImageAsset(name: "asistente-menu")
    internal static let camerOnboarding = ImageAsset(name: "camerOnboarding")
    internal static let cammy = ImageAsset(name: "cammy")
    internal static let chatBot = ImageAsset(name: "chat-bot")
    internal static let cryptoOnboarding1 = ImageAsset(name: "crypto-onboarding1")
    internal static let cryptoOnboarding2 = ImageAsset(name: "crypto-onboarding2")
    internal static let droneOnboarding1 = ImageAsset(name: "drone-onboarding1")
    internal static let integrationGrid = ImageAsset(name: "integrationGrid")
    internal static let lidarDrone = ImageAsset(name: "lidarDrone")
    internal static let onboarding1 = ImageAsset(name: "onboarding1")
    internal static let onboarding2 = ImageAsset(name: "onboarding2")
    internal static let onboarding3 = ImageAsset(name: "onboarding3")
    internal static let online3dPrintingProcessIsometricVector287067061 = ImageAsset(name: "online-3d-printing-process-isometric-vector-28706706 1")
    internal static let preview = ImageAsset(name: "preview")
    internal static let ruralDrone = ImageAsset(name: "rural-drone")
    internal static let scan3dOnboarding1 = ImageAsset(name: "scan3d-onboarding1")
    internal static let scan3dOnboarding2 = ImageAsset(name: "scan3d-onboarding2")
    internal static let scan3dOnboarding3 = ImageAsset(name: "scan3d-onboarding3")
    internal static let scan3dOnboarding4 = ImageAsset(name: "scan3d-onboarding4")
    internal static let thermalOnboarding1 = ImageAsset(name: "thermal-onboarding-1")
    internal static let thermalOnboarding2 = ImageAsset(name: "thermal-onboarding-2")
    internal static let videocallOnboarding = ImageAsset(name: "videocall-onboarding")
  }
  internal static let launchScreen = ImageAsset(name: "LaunchScreen")
  internal enum Menu {
    internal static let usdBlack = ImageAsset(name: "UsdBlack")
    internal static let bot = ImageAsset(name: "bot")
    internal static let galery = ImageAsset(name: "galery")
    internal static let help = ImageAsset(name: "help")
    internal static let settings = ImageAsset(name: "settings")
    internal static let wallet = ImageAsset(name: "wallet")
  }
  internal enum Miscelaneous {
    internal static let piGraph = ImageAsset(name: "piGraph")
    internal static let recamerGraph = ImageAsset(name: "recamerGraph")
  }
  internal enum PlansIcons {
    internal enum Basic {
      internal static let arHandsBasic = ImageAsset(name: "arHandsBasic")
      internal static let camera360Basic = ImageAsset(name: "camera360Basic")
      internal static let gamesBasic = ImageAsset(name: "gamesBasic")
      internal static let pixeladoBasic = ImageAsset(name: "pixeladoBasic")
      internal static let print3DBasic = ImageAsset(name: "print3DBasic")
      internal static let recordingBasic = ImageAsset(name: "recordingBasic")
      internal static let streetcamBasic = ImageAsset(name: "streetcamBasic")
      internal static let viodecallBasic = ImageAsset(name: "viodecallBasic")
    }
    internal enum Free {
      internal static let arHandsFree = ImageAsset(name: "arHandsFree")
      internal static let gamesFree = ImageAsset(name: "gamesFree")
      internal static let pixeladoFree = ImageAsset(name: "pixeladoFree")
      internal static let videocallFree = ImageAsset(name: "videocallFree")
    }
    internal enum Premium {
      internal static let adPremium = ImageAsset(name: "adPremium")
      internal static let aiPremium = ImageAsset(name: "aiPremium")
      internal static let alcoholPremium = ImageAsset(name: "alcoholPremium")
      internal static let arhandsPremium = ImageAsset(name: "arhandsPremium")
      internal static let bitcoinPremium = ImageAsset(name: "bitcoinPremium")
      internal static let camera360Premium = ImageAsset(name: "camera360Premium")
      internal static let crmPremium = ImageAsset(name: "crmPremium")
      internal static let detectorCablesPremium = ImageAsset(name: "detectorCablesPremium")
      internal static let detectorMetalesPremium = ImageAsset(name: "detectorMetalesPremium")
      internal static let dogRobotPremium = ImageAsset(name: "dogRobotPremium")
      internal static let dronePremium = ImageAsset(name: "dronePremium")
      internal static let ecografiaPremium = ImageAsset(name: "ecografiaPremium")
      internal static let gamesPremium = ImageAsset(name: "gamesPremium")
      internal static let georradarPremium = ImageAsset(name: "georradarPremium")
      internal static let iotPremium = ImageAsset(name: "iotPremium")
      internal static let lawPremium = ImageAsset(name: "lawPremium")
      internal static let lidarPremium = ImageAsset(name: "lidarPremium")
      internal static let mascotaPremium = ImageAsset(name: "mascotaPremium")
      internal static let nftPremium = ImageAsset(name: "nftPremium")
      internal static let pixeladoPremium = ImageAsset(name: "pixeladoPremium")
      internal static let print3dPremium = ImageAsset(name: "print3dPremium")
      internal static let recordingPremium = ImageAsset(name: "recordingPremium")
      internal static let roboticaPremium = ImageAsset(name: "roboticaPremium")
      internal static let rovPremium = ImageAsset(name: "rovPremium")
      internal static let streetcamPremium = ImageAsset(name: "streetcamPremium")
      internal static let telepresenciaPremium = ImageAsset(name: "telepresenciaPremium")
      internal static let thermalCameraPremium = ImageAsset(name: "thermalCameraPremium")
      internal static let twinsPremium = ImageAsset(name: "twinsPremium")
      internal static let videocallPremium = ImageAsset(name: "videocallPremium")
    }
  }
  internal enum SocialMedia {
    internal static let apple = ImageAsset(name: "apple")
    internal static let facebook = ImageAsset(name: "facebook")
    internal static let google = ImageAsset(name: "google")
  }
  internal enum TabBar {
    internal static let menu = ImageAsset(name: "Menu")
    internal static let grid = ImageAsset(name: "grid")
    internal static let home = ImageAsset(name: "home")
  }
  internal static let logo = ImageAsset(name: "logo")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
