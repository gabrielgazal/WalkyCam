import SwiftUI

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceDetailsInteractorProtocol
    var onCancelAction: (() -> Void)?

    // MARK: - Initialization

    init(interactor: ServiceDetailsInteractorProtocol = ServiceDetailsInteractor(),
         onCancelAction: (() -> Void)? = nil) {
        self.interactor = interactor
        self.onCancelAction = onCancelAction
    }

    // MARK: - Public API

    func cancelAction() {
        onCancelAction?()
    }
}
