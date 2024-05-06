import SwiftUI

final class IdentityUploadViewModel: IdentityUploadViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: IdentityUploadInteractorProtocol
    @Published var frontUploaded: Bool = false
    @Published var backUploaded: Bool = false
    
    // MARK: - Initialization

    init(interactor: IdentityUploadInteractorProtocol = IdentityUploadInteractor()) {
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
