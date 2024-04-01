import SwiftUI

final class RobotMenuViewModel: RobotMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RobotMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: RobotMenuInteractorProtocol = RobotMenuInteractor()) {
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
