import SwiftUI

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceDetailsInteractorProtocol
    var onCancelAction: (() -> Void)?
    @Published var service: FunctionData = .init(title: "", icon: "")
    @Published var currentStep: Int
    @Published var totalSteps: Int
    
    // MARK: - Initialization

    init(interactor: ServiceDetailsInteractorProtocol = ServiceDetailsInteractor(),
         currentStep: Int,
         totalSteps: Int,
         onCancelAction: (() -> Void)? = nil) {
        self.interactor = interactor
        self.currentStep = currentStep
        self.totalSteps = totalSteps
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
