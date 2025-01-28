import SwiftUI

final class AppleWatchSimulatorViewModel: AppleWatchSimulatorViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AppleWatchSimulatorInteractorProtocol

    // MARK: - Initialization

    init(interactor: AppleWatchSimulatorInteractorProtocol = AppleWatchSimulatorInteractor()) {
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
