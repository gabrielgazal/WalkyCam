import SwiftUI

final class FlightMenuViewModel: FlightMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FlightMenuInteractorProtocol
    @Published var menuMode: FlightMenuMode

    // MARK: - Initialization

    init(interactor: FlightMenuInteractorProtocol = FlightMenuInteractor(),
         menuMode: FlightMenuMode) {
        self.interactor = interactor
        self.menuMode = menuMode
    }
}
