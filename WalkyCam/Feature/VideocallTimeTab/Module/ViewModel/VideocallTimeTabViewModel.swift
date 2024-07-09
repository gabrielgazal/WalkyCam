import SwiftUI

final class VideocallTimeTabViewModel: VideocallTimeTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideocallTimeTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideocallTimeTabInteractorProtocol = VideocallTimeTabInteractor()) {
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
