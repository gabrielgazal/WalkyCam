import SwiftUI

final class TimeTabViewModel: TimeTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: TimeTabInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    
    // MARK: - Initialization

    init(interactor: TimeTabInteractorProtocol = TimeTabInteractor(),
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.serviceManager = serviceManager
    }

    // MARK: - Public API

    func updateSelectedDate(_ date: Date) {
        let calendar = Calendar.current
        let currentDate = serviceManager.getServiceBasicInformation().date
        
        let newComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        let oldComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        if let hour = newComponents.hour,
           let minutes = newComponents.minute,
           let seconds = newComponents.second,
           let newDate = calendar.date(bySettingHour: hour,
                                       minute: minutes,
                                       second: seconds,
                                       of: currentDate) {
            serviceManager.updateDate(newDate)
            serviceManager.updateEndDate(newDate)
        }
    }
    
    func updateEndTime(_ date: Date) {
        let calendar = Calendar.current
        let currentDate = ServiceInformationManager.shared.getServiceBasicInformation().endDate
        
        let newComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        let oldComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        if let hour = newComponents.hour,
           let minutes = newComponents.minute,
           let seconds = newComponents.second,
           let newDate = calendar.date(bySettingHour: hour,
                                       minute: minutes,
                                       second: seconds,
                                       of: currentDate) {
            ServiceInformationManager.shared.updateEndDate(newDate)
        }
    }
}
