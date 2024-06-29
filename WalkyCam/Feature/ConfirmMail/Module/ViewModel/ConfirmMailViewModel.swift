import SwiftUI

final class ConfirmMailViewModel: ConfirmMailViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ConfirmMailInteractorProtocol

    // MARK: - Initialization

    init(interactor: ConfirmMailInteractorProtocol = ConfirmMailInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func openEmailApp() {
        if let url = URL(string: "message://") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}
