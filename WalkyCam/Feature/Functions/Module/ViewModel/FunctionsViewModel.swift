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
            .init(title: L10n.FunctionsViewModel.Function.videoCall, icon: Asset.Icons.videoCall.name),
            .init(title: L10n.FunctionsViewModel.Function.streetCam, icon: Asset.Icons.streetCam.name),
            .init(title: L10n.FunctionsViewModel.Function.arHands, icon: Asset.Icons.ar.name),
            .init(title: L10n.FunctionsViewModel.Function.scan3D, icon: Asset.Icons.scan3D.name),
            .init(title: L10n.FunctionsViewModel.Function.cam360, icon: Asset.Icons._360Camera.name),
            .init(title: L10n.FunctionsViewModel.Function.certifiedRecording, icon: Asset.Icons.translate.name),
            .init(title: L10n.FunctionsViewModel.Function.games, icon: Asset.Icons.games.name),
            .init(title: L10n.FunctionsViewModel.Function.playBusiness, icon: Asset.Icons.playBusiness.name),
        ]
    }

    private func fetchOtherFunctions() {
        otherFunctions = [
            .init(title: L10n.FunctionsViewModel.Function.digitalTwins, icon: Asset.Icons.digitalTwins.name),
            .init(title: L10n.FunctionsViewModel.Function.iot, icon: Asset.Icons.iot.name),
            .init(title: L10n.FunctionsViewModel.Function.printer3D, icon: Asset.Icons._3dPrinting.name),
            .init(title: L10n.FunctionsViewModel.Function.ai, icon: Asset.Icons.aiAnalysis.name),
            .init(title: L10n.FunctionsViewModel.Function.droneFly, icon: Asset.Icons.drone.name),
            .init(title: L10n.FunctionsViewModel.Function.drugTest, icon: Asset.Icons.alcohol.name),
            .init(title: L10n.FunctionsViewModel.Function.nft, icon: Asset.Icons.nft.name),
            .init(title: L10n.FunctionsViewModel.Function.ruralDrone, icon: Asset.Icons.riego.name),
            .init(title: L10n.FunctionsViewModel.Function.cryptoWallet, icon: Asset.Icons.crypto.name)
        ]
    }

    private func fetchPremiumFunctions() {
        premiumFunctions = [
            .init(title: L10n.FunctionsViewModel.Function.rov, icon: Asset.Icons.rov.name),
            .init(title: L10n.FunctionsViewModel.Function.lidar, icon: Asset.Icons.lidar.name),
            .init(title: L10n.FunctionsViewModel.Function.radar, icon: Asset.Icons.radar.name),
            .init(title: L10n.FunctionsViewModel.Function.engineering, icon: Asset.Icons.engineering.name),
            .init(title: L10n.FunctionsViewModel.Function.thermalCamera, icon: Asset.Icons.thermalCamera.name),
            .init(title: L10n.FunctionsViewModel.Function.screenAd, icon: Asset.Icons.backpack.name),
            .init(title: L10n.FunctionsViewModel.Function.crm, icon: Asset.Icons.crm.name),
            .init(title: L10n.FunctionsViewModel.Function.ecografia, icon: Asset.Icons.ecografia.name),
            .init(title: L10n.FunctionsViewModel.Function.lawConsulting, icon: Asset.Icons.lawyer.name),
            .init(title: L10n.FunctionsViewModel.Function.robot, icon: Asset.Icons.robotica.name),
            .init(title: L10n.FunctionsViewModel.Function.metalDetector, icon: Asset.Icons.detectorMetales.name),
            .init(title: L10n.FunctionsViewModel.Function.georadar, icon: Asset.Icons.radar.name),
            .init(title: L10n.FunctionsViewModel.Function.cableDetector, icon: Asset.Icons.cables.name),
            .init(title: L10n.FunctionsViewModel.Function.networkAnalyzer, icon: Asset.Icons.analisadorRedes.name),
            .init(title: L10n.FunctionsViewModel.Function.mascotRobot, icon: Asset.Icons.mascotas.name),
            .init(title: L10n.FunctionsViewModel.Function.dogRobot, icon: Asset.Icons.robotDog.name),
            .init(title: L10n.FunctionsViewModel.Function.telepresenceRobot, icon: Asset.Icons.telepresencia.name)
        ]
    }
}
