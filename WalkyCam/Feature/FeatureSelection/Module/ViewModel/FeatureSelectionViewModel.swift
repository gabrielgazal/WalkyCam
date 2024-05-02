import SwiftUI

final class FeatureSelectionViewModel: FeatureSelectionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FeatureSelectionInteractorProtocol
    @Published var devicesModel: [SelectorModel] = [
        .init(key: Asset.Icons.lidar.name, value: "LIDAR", isSelected: false),
        .init(key: Asset.Icons.smartphone.name, value: "Móvil/Smartphone", isSelected: false),
        .init(key: Asset.Icons.drone.name, value: "Drone", isSelected: false),
        .init(key: Asset.Icons.lidar.name, value: "Videocámara", isSelected: false),
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
    ]
    
    @Published var abilitiesModel: [SelectorModel] = [
        .init(value: "Escaneo 3D"),
        .init(value: "Impresiones 3D"),
        .init(value: "Escaneo LIDAR"),
        .init(value: "Fotografía submarina"),
        .init(value: "Buceo"),
        .init(value: "Trabajo en altura"),
        .init(value: "Hablar en público"),
    ]
    
    // MARK: - Initialization

    init(interactor: FeatureSelectionInteractorProtocol = FeatureSelectionInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

    #warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
