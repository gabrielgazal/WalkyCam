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
    internal static let search = ImageAsset(name: "search")
  }
  internal enum Fondos {
    internal static let droneFondo = ImageAsset(name: "drone_fondo")
    internal static let loginFondo = ImageAsset(name: "login_fondo")
    internal static let planFondo = ImageAsset(name: "plan_fondo")
    internal static let videocallFondo = ImageAsset(name: "videocall_fondo")
  }
  internal enum Icons {
    internal static let _360Camera = ImageAsset(name: "360Camera")
    internal static let _3dPrinting = ImageAsset(name: "3dPrinting")
    internal static let aiAnalysis = ImageAsset(name: "AIAnalysis")
    internal static let ar = ImageAsset(name: "AR")
    internal static let agriculture = ImageAsset(name: "Agriculture")
    internal static let art = ImageAsset(name: "Art")
    internal static let building = ImageAsset(name: "Building")
    internal static let camera = ImageAsset(name: "Camera")
    internal static let compare = ImageAsset(name: "Compare")
    internal static let cryptocurrency = ImageAsset(name: "Cryptocurrency")
    internal static let drone = ImageAsset(name: "Drone")
    internal static let farming = ImageAsset(name: "Farming")
    internal static let files = ImageAsset(name: "Files")
    internal static let filter = ImageAsset(name: "Filter")
    internal static let fleet = ImageAsset(name: "Fleet")
    internal static let health = ImageAsset(name: "Health")
    internal static let industrial = ImageAsset(name: "Industrial")
    internal static let industry = ImageAsset(name: "Industry")
    internal static let karaoke = ImageAsset(name: "Karaoke")
    internal static let lentes = ImageAsset(name: "LENTES")
    internal static let link = ImageAsset(name: "Link")
    internal static let location = ImageAsset(name: "Location")
    internal static let music = ImageAsset(name: "Music")
    internal static let notes = ImageAsset(name: "Notes")
    internal static let recent = ImageAsset(name: "Recent")
    internal static let retail = ImageAsset(name: "Retail")
    internal static let riego = ImageAsset(name: "Riego")
    internal static let scan3D = ImageAsset(name: "Scan3D")
    internal static let share = ImageAsset(name: "Share")
    internal static let shop = ImageAsset(name: "Shop")
    internal static let smartCity = ImageAsset(name: "SmartCity")
    internal static let smartHome = ImageAsset(name: "SmartHome")
    internal static let streetCam = ImageAsset(name: "Street Cam")
    internal static let tShirt = ImageAsset(name: "T-Shirt")
    internal static let usd = ImageAsset(name: "Usd")
    internal static let videoCall = ImageAsset(name: "VideoCall")
    internal static let accionesDetalle = ImageAsset(name: "acciones detalle")
    internal static let alcohol = ImageAsset(name: "alcohol")
    internal static let analisadorRedes = ImageAsset(name: "analisadorRedes")
    internal static let backpack = ImageAsset(name: "backpack")
    internal static let cables = ImageAsset(name: "cables")
    internal static let calendar = ImageAsset(name: "calendar")
    internal static let cash = ImageAsset(name: "cash")
    internal static let check = ImageAsset(name: "check")
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
    internal static let hair = ImageAsset(name: "hair")
    internal static let heart = ImageAsset(name: "heart")
    internal static let images = ImageAsset(name: "images")
    internal static let iot = ImageAsset(name: "iot")
    internal static let lawyer = ImageAsset(name: "lawyer")
    internal static let lidar = ImageAsset(name: "lidar")
    internal static let mail = ImageAsset(name: "mail")
    internal static let market = ImageAsset(name: "market")
    internal static let mascotas = ImageAsset(name: "mascotas")
    internal static let messageCircle = ImageAsset(name: "message-circle")
    internal static let newspaper = ImageAsset(name: "newspaper")
    internal static let nft = ImageAsset(name: "nft")
    internal static let nftCoin = ImageAsset(name: "nftCoin")
    internal static let orangeShare = ImageAsset(name: "orangeShare")
    internal static let pi = ImageAsset(name: "pi")
    internal static let pixelation = ImageAsset(name: "pixelation")
    internal static let plane = ImageAsset(name: "plane")
    internal static let radar = ImageAsset(name: "radar")
    internal static let rc2 = ImageAsset(name: "rc2")
    internal static let rgb = ImageAsset(name: "rgb")
    internal static let robotW = ImageAsset(name: "robot-w")
    internal static let robotDog = ImageAsset(name: "robotDog")
    internal static let robotica = ImageAsset(name: "robotica")
    internal static let rov = ImageAsset(name: "rov")
    internal static let shareGrid = ImageAsset(name: "shareGrid")
    internal static let socialsGrid = ImageAsset(name: "socialsGrid")
    internal static let telepresencia = ImageAsset(name: "telepresencia")
    internal static let thermalCamera = ImageAsset(name: "thermalCamera")
    internal static let translate = ImageAsset(name: "translate")
    internal static let videos = ImageAsset(name: "videos")
    internal static let wIcon = ImageAsset(name: "wIcon")
    internal static let walkycamerHands = ImageAsset(name: "walkycamerHands")
  }
  internal enum Illustrations {
    internal static let asistenteRemoto = ImageAsset(name: "Asistente Remoto")
    internal static let asistenteMenu = ImageAsset(name: "asistente-menu")
    internal static let camerOnboarding = ImageAsset(name: "camerOnboarding")
    internal static let cammy = ImageAsset(name: "cammy")
    internal static let chatBot = ImageAsset(name: "chat-bot")
    internal static let cryptoOnboarding1 = ImageAsset(name: "crypto-onboarding1")
    internal static let cryptoOnboarding2 = ImageAsset(name: "crypto-onboarding2")
    internal static let droneOnboarding1 = ImageAsset(name: "drone-onboarding1")
    internal static let onboarding1 = ImageAsset(name: "onboarding1")
    internal static let onboarding2 = ImageAsset(name: "onboarding2")
    internal static let onboarding3 = ImageAsset(name: "onboarding3")
    internal static let ruralDrone = ImageAsset(name: "rural-drone")
    internal static let scan3dOnboarding1 = ImageAsset(name: "scan3d-onboarding1")
    internal static let scan3dOnboarding2 = ImageAsset(name: "scan3d-onboarding2")
    internal static let scan3dOnboarding3 = ImageAsset(name: "scan3d-onboarding3")
    internal static let scan3dOnboarding4 = ImageAsset(name: "scan3d-onboarding4")
    internal static let videocallOnboarding = ImageAsset(name: "videocall-onboarding")
  }
  internal static let launchScreen = ImageAsset(name: "LaunchScreen")
  internal enum Menu {
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
