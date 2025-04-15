import SwiftUI

final class NativeVideoCallViewModel: NativeVideoCallViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: NativeVideoCallInteractorProtocol

    // MARK: - Initialization

    init(interactor: NativeVideoCallInteractorProtocol = NativeVideoCallInteractor()) {
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
