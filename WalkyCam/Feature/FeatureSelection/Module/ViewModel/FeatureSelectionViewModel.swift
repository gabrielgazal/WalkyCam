import SwiftUI

final class FeatureSelectionViewModel: FeatureSelectionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FeatureSelectionInteractorProtocol
    @Published var devicesModel: [SelectorModel] = [
        .init(key: Asset.Icons.lidar.name, value: "LIDAR", isSelected: false),
        .init(key: Asset.Icons.smartphone.name, value: "Móvil/Smartphone", isSelected: false),
        .init(key: Asset.Icons.drone.name, value: "Drone", isSelected: false),
        .init(key: Asset.Icons.camera.name, value: "Videocámara", isSelected: false),
        .init(key: Asset.Icons.rov.name, value: "ROV Submarino", isSelected: false),
        .init(key: Asset.Icons._360Camera.name, value: "Cámara 360º", isSelected: false),
        .init(key: Asset.Icons.scan3D.name, value: "Escaner 3D", isSelected: false),
        .init(key: Asset.Icons.alcohol.name, value: "Test alcohol y drogas", isSelected: false),
        .init(key: Asset.Icons.thermalCamera.name, value: "Camara termografica", isSelected: false),
        .init(key: Asset.Icons.detectorMetales.name, value: "Detector de metales", isSelected: false),
        .init(key: Asset.Icons.analisadorRedes.name, value: "Analizador de redes electricas", isSelected: false),
        .init(key: Asset.Icons.cables.name, value: "Detector de cables", isSelected: false),
        .init(key: Asset.Icons._3dPrinting.name, value: "3D Printer", isSelected: false),
        .init(key: Asset.Icons.robotDog.name, value: "Robot Dog", isSelected: false),
        .init(key: "", value: "Sin dispositivo", isSelected: false)
    ]
    
    @Published var abilitiesModel: [SelectorModel] = [
        .init(key: "scan3d", value: "Escaneo 3D"),
        .init(key: "3dprint", value: "Impresiones 3D"),
        .init(key: "lidar", value: "Escaneo LIDAR"),
        .init(key: "subPhoto", value: "Fotografía submarina"),
        .init(key: "dive", value: "Buceo"),
        .init(key: "highWork", value: "Trabajo en altura"),
        .init(key: "publicTalking", value: "Hablar en público"),
        .init(key: "vehicle", value: "Cuento con vehículo propio"),
        .init(key: "acting", value: "Actuar (animador de fiestas)")
    ]
    
    // MARK: - Initialization

    init(interactor: FeatureSelectionInteractorProtocol = FeatureSelectionInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func saveDevicedAndAbilities() {

    }
}
