import SwiftUI

final class TimeTabViewModel: TimeTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: TimeTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: TimeTabInteractorProtocol = TimeTabInteractor()) {
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
