import SwiftUI

final class RegistrationPlansViewModel: RegistrationPlansViewModelProtocol {

    // MARK: - Dependencies

    @Published var availablePlans: AsyncData<[AvailablePlanData], ErrorProtocol> = .idle
    private let interactor: RegistrationPlansInteractorProtocol

    // MARK: - Initialization

    init(interactor: RegistrationPlansInteractorProtocol) {
        self.interactor = interactor
    }

    @MainActor func fetchAvailablePlans() async {
        availablePlans = .loading
        do {
            let plans = try await interactor.fetchAvailablePlans()
            availablePlans = .loaded(plans)
            PlansManager.shared.savePlans(plans)
        } catch {
            availablePlans = .failed(GenericError())
        }
    }
}
