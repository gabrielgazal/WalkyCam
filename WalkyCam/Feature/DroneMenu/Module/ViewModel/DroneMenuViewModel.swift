import SwiftUI

final class DroneMenuViewModel: DroneMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: DroneMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: DroneMenuInteractorProtocol = DroneMenuInteractor()) {
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
