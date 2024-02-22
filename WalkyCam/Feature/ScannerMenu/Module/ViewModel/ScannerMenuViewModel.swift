import SwiftUI

final class ScannerMenuViewModel: ScannerMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ScannerMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: ScannerMenuInteractorProtocol = ScannerMenuInteractor()) {
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
