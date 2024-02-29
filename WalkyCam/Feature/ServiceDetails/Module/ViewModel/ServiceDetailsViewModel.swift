import SwiftUI

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceDetailsInteractorProtocol
    var onCancelAction: (() -> Void)?
    @Published var service: FunctionData = .init(title: "", icon: "")

    // MARK: - Initialization

    init(interactor: ServiceDetailsInteractorProtocol = ServiceDetailsInteractor(),
         onCancelAction: (() -> Void)? = nil) {
        self.interactor = interactor
        self.onCancelAction = onCancelAction
        initializeService()
    }

    // MARK: - Public API

    func cancelAction() {
        onCancelAction?()
    }

    // MARK: - Private Methods

    private func initializeService() {
        self.service = FunctionType(rawValue: UserDefaults.standard.string(forKey: "currentService") ?? "")?.convertedValue ?? .init(title: "", icon: "")
    }
}
