import SwiftUI

final class CalendarTabViewModel: CalendarTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CalendarTabInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    
    // MARK: - Initialization

    init(interactor: CalendarTabInteractorProtocol = CalendarTabInteractor(),
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.serviceManager = serviceManager
    }

    // MARK: - Public API

    func updateSelectedDate(_ date: Date) {
        let calendar = Calendar.current
        let currentDate = serviceManager.getServiceBasicInformation().date
        
        let newComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let oldComponents = calendar.dateComponents([.hour, .minute, .second], from: currentDate)
        if let hour = oldComponents.hour,
           let minutes = oldComponents.minute,
           let seconds = oldComponents.second,
           let newDate = calendar.date(from: newComponents),
           let newDate = calendar.date(bySettingHour: hour,
                                       minute: minutes,
                                       second: seconds,
                                       of: newDate) {
            serviceManager.updateDate(newDate)
        }
    }
}
