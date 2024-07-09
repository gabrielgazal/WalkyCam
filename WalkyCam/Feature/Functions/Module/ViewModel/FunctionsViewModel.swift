import SwiftUI

final class FunctionsViewModel: FunctionsViewModelProtocol {

    // MARK: - Dependencies
    @Published var basicFunctions: [FunctionData] = []
    @Published var otherFunctions: [FunctionData] = []
    @Published var premiumFunctions: [FunctionData] = []

    private let interactor: FunctionsInteractorProtocol

    // MARK: - Initialization

    init(interactor: FunctionsInteractorProtocol = FunctionsInteractor()) {
        self.interactor = interactor
        initializeFunctions()
    }

    // MARK: - Private Methods

    private func initializeFunctions() {
        fetchBasicFunctions()
        fetchOtherFunctions()
        fetchPremiumFunctions()
    }

    private func fetchBasicFunctions() {
        basicFunctions = [
            .init(title: "Video Call", icon: Asset.Icons.videoCall.name),
            .init(title: "Street Cam", icon: Asset.Icons.streetCam.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Cam 360º", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "Games", icon: Asset.Icons.games.name),
            .init(title: "Play & Business", icon: Asset.Icons.playBusiness.name),
        ]
    }

    private func fetchOtherFunctions() {
        otherFunctions = [
            .init(title: "Digital Twins", icon: Asset.Icons.digitalTwins.name),
            .init(title: "IOT applications & Data Analysis", icon: Asset.Icons.iot.name),
            .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
            .init(title: "AI & Data Analysis", icon: Asset.Icons.aiAnalysis.name),
            .init(title: "Drone Fly", icon: Asset.Icons.drone.name),
            .init(title: "Alcohol & Drug test", icon: Asset.Icons.alcohol.name),
            .init(title: "NFT platform", icon: Asset.Icons.nft.name),
            .init(title: "Crypto Wallet", icon: Asset.Icons.crypto.name)
        ]
    }

    private func fetchPremiumFunctions() {
        premiumFunctions = [
            .init(title: "R.O.V. Underwater Drone", icon: Asset.Icons.rov.name),
            .init(title: "LIDAR Scan", icon: Asset.Icons.lidar.name),
            .init(title: "Radar & Sensors", icon: Asset.Icons.radar.name),
            .init(title: "Engineering (Consulting only)", icon: Asset.Icons.engineering.name),
            .init(title: "Thermal Camera", icon: Asset.Icons.thermalCamera.name),
            .init(title: "Backpack Screen Advertising", icon: Asset.Icons.backpack.name),
            .init(title: "Link to CRM/ERP", icon: Asset.Icons.crm.name),
            .init(title: "Ecografia", icon: Asset.Icons.ecografia.name),
            .init(title: "Lawyer (Consulting only)", icon: Asset.Icons.lawyer.name),
            .init(title: "Robótica", icon: Asset.Icons.robotica.name),
            .init(title: "Detector de metales", icon: Asset.Icons.detectorMetales.name)
        ]
    }
}
