import SwiftUI

final class FlightMenuViewModel: FlightMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FlightMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: FlightMenuInteractorProtocol = FlightMenuInteractor()) {
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
