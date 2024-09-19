import SwiftUI

final class AvailabilityTabViewModel: AvailabilityTabViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: AvailabilityTabInteractorProtocol
    @Published var availableOptions: [AvailabilityTabModel] = [
        .init(title: L10n.AvailabilityTabViewModel.Days.everyday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.sunday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.monday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.tuesday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.wednesday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.thursday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.friday, active: false),
        .init(title: L10n.AvailabilityTabViewModel.Days.saturday, active: false)
    ]
    
    // MARK: - Initialization
    
    init(interactor: AvailabilityTabInteractorProtocol = AvailabilityTabInteractor()) {
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
