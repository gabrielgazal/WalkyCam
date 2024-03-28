import SwiftUI

final class RadarMenuViewModel: RadarMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: RadarMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: RadarMenuInteractorProtocol = RadarMenuInteractor()) {
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
