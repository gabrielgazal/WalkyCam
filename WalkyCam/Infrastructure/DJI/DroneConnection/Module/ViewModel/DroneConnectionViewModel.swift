import SwiftUI

final class DroneConnectionViewModel: DroneConnectionViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: DroneConnectionInteractorProtocol

    // MARK: - Initialization

    init(interactor: DroneConnectionInteractorProtocol = DroneConnectionInteractor()) {
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
