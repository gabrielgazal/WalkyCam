import SwiftUI

final class SettingsViewModel: SettingsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SettingsInteractorProtocol

    // MARK: - Initialization

    init(interactor: SettingsInteractorProtocol = SettingsInteractor()) {
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
