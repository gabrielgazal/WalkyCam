import SwiftUI

final class ComparePlansViewModel: ComparePlansViewModelProtocol {

    // MARK: - Dependencies

    @Published var currentPage: Int = 0
    @Published var availablePlans: AsyncData<[AvailablePlanData], ErrorProtocol> = .idle
    private let interactor: ComparePlansInteractorProtocol

    // MARK: - Initialization

    init(interactor: ComparePlansInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Private Methods

    @MainActor func fetchAvailablePlans() async {
        availablePlans = .loading
        do {
            let plans = try await interactor.fetchAvailablePlans()
            availablePlans = .loaded(plans)
        } catch {
            availablePlans = .failed(GenericError())
        }
    }
}
