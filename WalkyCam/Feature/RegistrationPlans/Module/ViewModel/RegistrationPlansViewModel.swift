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
            savePlansPricesToDefaults(plans)
        } catch {
            availablePlans = .failed(GenericError())
        }
    }

    private func savePlansPricesToDefaults(_ plans: [AvailablePlanData]) {
        UserDefaults.standard.set(plans.first(where: { $0.name == "free" })?.monthlyPrice, forKey: "freePlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "basic" })?.monthlyPrice, forKey: "basicPlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "standard" })?.monthlyPrice, forKey: "standardPlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "premium" })?.monthlyPrice, forKey: "premiumPlanMonthlyPrice")
        
        UserDefaults.standard.set(plans.first(where: { $0.name == "free" })?.yearlyPrice, forKey: "freePlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "basic" })?.yearlyPrice, forKey: "basicPlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "standard" })?.yearlyPrice, forKey: "standardPlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "premium" })?.yearlyPrice, forKey: "premiumPlanYearlyPrice")
    }
}
