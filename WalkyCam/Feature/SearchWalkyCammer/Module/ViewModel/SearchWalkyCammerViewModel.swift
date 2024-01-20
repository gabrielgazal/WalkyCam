import SwiftUI

final class SearchWalkyCammerViewModel: SearchWalkyCammerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SearchWalkyCammerInteractorProtocol

    // MARK: - Initialization

    init(interactor: SearchWalkyCammerInteractorProtocol = SearchWalkyCammerInteractor()) {
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
