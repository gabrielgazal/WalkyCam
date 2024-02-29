import SwiftUI

final class ConfigureAccessViewModel: ConfigureAccessViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ConfigureAccessInteractorProtocol
    @Published var externalPermissions: [PermissionModel] = [
        .init(title: "Galería", icon: Asset.Icons.images.name, permitted: false),
        .init(title: "Cámara", icon: Asset.Icons.camera.name, permitted: false),
        .init(title: "Micrófono", icon: Asset.Icons.images.name, permitted: false),
        .init(title: "Ubicación", icon: Asset.Icons.location.name, permitted: false)
    ]
    @Published var internalPermissions: [PermissionModel] = [
        .init(title: "CRM", icon: Asset.Icons.crm.name, permitted: false),
        .init(title: "IOT", icon: Asset.Icons.iot.name, permitted: false),
        .init(title: "Printer 3D", icon: Asset.Icons._3dPrinting.name, permitted: false),
        .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name, permitted: false),
        .init(title: "Drone", icon: Asset.Icons.drone.name, permitted: false)
    ]
    @Published var integrationViewHidden: Bool = true

    // MARK: - Initialization

    init(interactor: ConfigureAccessInteractorProtocol = ConfigureAccessInteractor()) {
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
