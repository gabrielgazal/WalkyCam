import SwiftUI

final class StreetCamMenuViewModel: StreetCamMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: StreetCamMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: StreetCamMenuInteractorProtocol = StreetCamMenuInteractor()) {
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
