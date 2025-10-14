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
    func saveData() {
        var data = WalkcamerRegistrationManager.shared.getData()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let dataToReturn: [AvailableDayInfo] = availableOptions
            .filter { $0.active }
            .map { model in
                let primaryStart = dateFormatter.string(from: model.firstTime.initialTime)
                let primaryEnd = dateFormatter.string(from: model.firstTime.finalTime)
                
                let secondaryStart = model.secondTime.map { dateFormatter.string(from: $0.initialTime) } ?? ""
                let secondaryEnd = model.secondTime.map { dateFormatter.string(from: $0.finalTime) } ?? ""
                
                return AvailableDayInfo(
                    name: model.title,
                    primaryStartTime: primaryStart,
                    primaryEndTime: primaryEnd,
                    secondaryStartTime: secondaryStart,
                    secondaryEndTime: secondaryEnd
                )
            }
        data.days = dataToReturn
        WalkcamerRegistrationManager.shared.updateCammerData(data)
    }
}
