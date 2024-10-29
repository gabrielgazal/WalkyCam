import SwiftUI

final class FeatureSelectionViewModel: FeatureSelectionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FeatureSelectionInteractorProtocol
    @Published var devicesModel: [SelectorModel] = [
        .init(key: Asset.Icons.lidar.name, value: L10n.FeatureSelectionViewModel.DevicesModel.lidar, isSelected: false),
        .init(key: Asset.Icons.smartphone.name, value: L10n.FeatureSelectionViewModel.DevicesModel.smartphone, isSelected: false),
        .init(key: Asset.Icons.drone.name, value: L10n.FeatureSelectionViewModel.DevicesModel.drone, isSelected: false),
        .init(key: Asset.Icons.camera.name, value: L10n.FeatureSelectionViewModel.DevicesModel.videocamera, isSelected: false),
        .init(key: Asset.Icons.rov.name, value: L10n.FeatureSelectionViewModel.DevicesModel.rov, isSelected: false),
        .init(key: Asset.Icons._360Camera.name, value: L10n.FeatureSelectionViewModel.DevicesModel.camera360, isSelected: false),
        .init(key: Asset.Icons.scan3D.name, value: L10n.FeatureSelectionViewModel.DevicesModel.scan3D, isSelected: false),
        .init(key: Asset.Icons.alcohol.name, value: L10n.FeatureSelectionViewModel.DevicesModel.alcoholTest, isSelected: false),
        .init(key: Asset.Icons.thermalCamera.name, value: L10n.FeatureSelectionViewModel.DevicesModel.thermalCamera, isSelected: false),
        .init(key: Asset.Icons.detectorMetales.name, value: L10n.FeatureSelectionViewModel.DevicesModel.metalDetector, isSelected: false),
        .init(key: Asset.Icons.analisadorRedes.name, value: L10n.FeatureSelectionViewModel.DevicesModel.networkAnalyzer, isSelected: false),
        .init(key: Asset.Icons.cables.name, value: L10n.FeatureSelectionViewModel.DevicesModel.cableDetector, isSelected: false),
        .init(key: Asset.Icons._3dPrinting.name, value: L10n.FeatureSelectionViewModel.DevicesModel.printer3D, isSelected: false),
        .init(key: Asset.Icons.robotDog.name, value: L10n.FeatureSelectionViewModel.DevicesModel.robotDog, isSelected: false),
        .init(key: "", value: L10n.FeatureSelectionViewModel.DevicesModel.noDevice, isSelected: false)
    ]
    
    @Published var abilitiesModel: [SelectorModel] = [
        .init(key: "scan3d", value: L10n.FeatureSelectionViewModel.AbilitiesModel.scan3d),
        .init(key: "3dprint", value: L10n.FeatureSelectionViewModel.AbilitiesModel._3dprint),
        .init(key: "lidar", value: L10n.FeatureSelectionViewModel.AbilitiesModel.lidar),
        .init(key: "subPhoto", value: L10n.FeatureSelectionViewModel.AbilitiesModel.subPhoto),
        .init(key: "dive", value: L10n.FeatureSelectionViewModel.AbilitiesModel.dive),
        .init(key: "highWork", value: L10n.FeatureSelectionViewModel.AbilitiesModel.highWork),
        .init(key: "publicTalking", value: L10n.FeatureSelectionViewModel.AbilitiesModel.publicTalking),
        .init(key: "vehicle", value: L10n.FeatureSelectionViewModel.AbilitiesModel.vehicle),
        .init(key: "acting", value: L10n.FeatureSelectionViewModel.AbilitiesModel.acting)
    ]
    
    // MARK: - Initialization

    init(interactor: FeatureSelectionInteractorProtocol = FeatureSelectionInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func saveDevicedAndAbilities() {

    }
}
