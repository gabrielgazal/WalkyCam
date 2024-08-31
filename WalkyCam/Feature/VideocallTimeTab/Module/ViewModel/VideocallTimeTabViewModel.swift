import SwiftUI

final class VideocallTimeTabViewModel: VideocallTimeTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideocallTimeTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideocallTimeTabInteractorProtocol = VideocallTimeTabInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func someAction() {

    }

    // MARK: - Private Methods

    func updateSelectedDate(_ date: Date) {
        let calendar = Calendar.current
        let currentDate = ServiceInformationManager.shared.getServiceBasicInformation().date
        
        let newComponents = calendar.dateComponents([.hour, .minute, .second], from: date)
        let oldComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        if let hour = newComponents.hour,
           let minutes = newComponents.minute,
           let seconds = newComponents.second,
           let newDate = calendar.date(bySettingHour: hour,
                                       minute: minutes,
                                       second: seconds,
                                       of: currentDate) {
            ServiceInformationManager.shared.updateDate(newDate)
            ServiceInformationManager.shared.updateEndDate(newDate)
        }
    }
    
    func updateEndTime(_ date: Date) {
        let calendar = Calendar.current
        let currentDate = ServiceInformationManager.shared.getServiceBasicInformation().date
        
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
