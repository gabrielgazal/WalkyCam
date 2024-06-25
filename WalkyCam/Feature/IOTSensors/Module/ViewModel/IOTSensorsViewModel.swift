import SwiftUI

final class IOTSensorsViewModel: IOTSensorsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: IOTSensorsInteractorProtocol

    // MARK: - Initialization

    init(interactor: IOTSensorsInteractorProtocol = IOTSensorsInteractor()) {
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
