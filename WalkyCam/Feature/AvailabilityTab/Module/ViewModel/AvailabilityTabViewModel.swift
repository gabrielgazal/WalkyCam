import SwiftUI

final class AvailabilityTabViewModel: AvailabilityTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailabilityTabInteractorProtocol
    @Published var availableOptions: [AvailabilityTabModel] = [
        .init(title: "Todos los dias", active: false),
        .init(title: "Domingo", active: false),
        .init(title: "Lunes", active: false),
        .init(title: "Martes", active: false),
        .init(title: "Miercoles", active: false),
        .init(title: "Jueves", active: false),
        .init(title: "Viernes", active: false),
        .init(title: "Sabado", active: false)
    ]
    
    // MARK: - Initialization

    init(interactor: AvailabilityTabInteractorProtocol = AvailabilityTabInteractor()) {
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
