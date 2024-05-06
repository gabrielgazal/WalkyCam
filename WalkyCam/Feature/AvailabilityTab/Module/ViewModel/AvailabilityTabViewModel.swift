import SwiftUI

final class AvailabilityTabViewModel: AvailabilityTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailabilityTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: AvailabilityTabInteractorProtocol = AvailabilityTabInteractor()) {
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
