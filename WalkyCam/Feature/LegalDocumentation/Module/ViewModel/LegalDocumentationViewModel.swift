import SwiftUI

final class LegalDocumentationViewModel: LegalDocumentationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: LegalDocumentationInteractorProtocol

    // MARK: - Initialization

    init(interactor: LegalDocumentationInteractorProtocol = LegalDocumentationInteractor()) {
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
