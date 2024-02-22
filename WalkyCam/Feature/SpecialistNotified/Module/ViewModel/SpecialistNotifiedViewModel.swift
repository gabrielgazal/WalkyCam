import SwiftUI

final class SpecialistNotifiedViewModel: SpecialistNotifiedViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SpecialistNotifiedInteractorProtocol

    // MARK: - Initialization

    init(interactor: SpecialistNotifiedInteractorProtocol = SpecialistNotifiedInteractor()) {
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
