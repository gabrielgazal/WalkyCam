import SwiftUI

final class CammerDetailsViewModel: CammerDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CammerDetailsInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    @Published var cammerData: CammerData
    @Published var topBarItems: [WCTopBarItem] = [
        .init(iconName: "", title: "Información"),
        .init(iconName: "", title: "Reseñas (10)")
    ]
    @Published var selection: WCTopBarItem = .init(iconName: "", title: "Información")
    @Published var specialistMode: Bool

    // MARK: - Initialization

    init(interactor: CammerDetailsInteractorProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared,
         cammerData: CammerData,
         specialistMode: Bool) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        self.cammerData = cammerData
        self.specialistMode = specialistMode
    }
    
    // MARK: - Public API
    
    func updateSelectedCammer() {
        serviceManager.updateCammerInformation(cammerData)
    }
}
