import SwiftUI

final class CammerDetailsViewModel: CammerDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CammerDetailsInteractorProtocol

    @Published var cammerData: CammerData
    @Published var topBarItems: [WCTopBarItem] = [
        .init(iconName: "", title: "Información"),
        .init(iconName: "", title: "Reseñas (10)")
    ]
    @Published var selection: WCTopBarItem = .init(iconName: "", title: "Información")

    // MARK: - Initialization

    init(interactor: CammerDetailsInteractorProtocol,
         cammerData: CammerData) {
        self.interactor = interactor
        self.cammerData = cammerData
    }
}
