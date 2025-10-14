import SwiftUI

final class UploadImageToPrintViewModel: UploadImageToPrintViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: UploadImageToPrintInteractorProtocol

    // MARK: - Initialization

    init(interactor: UploadImageToPrintInteractorProtocol = UploadImageToPrintInteractor()) {
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
