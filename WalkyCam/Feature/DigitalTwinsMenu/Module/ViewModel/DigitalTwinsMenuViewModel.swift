import SwiftUI

final class DigitalTwinsMenuViewModel: DigitalTwinsMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: DigitalTwinsMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: DigitalTwinsMenuInteractorProtocol = DigitalTwinsMenuInteractor()) {
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
