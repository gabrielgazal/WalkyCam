import SwiftUI

final class ScheduleVideoCallViewModel: ScheduleVideoCallViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ScheduleVideoCallInteractorProtocol
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var tabBarItems: [WCTopBarItem] = []

    // MARK: - Initialization

    init(interactor: ScheduleVideoCallInteractorProtocol = ScheduleVideoCallInteractor()) {
        self.interactor = interactor
        self.initializeTabs()
    }

    // MARK: - Private Methods
    
    private func initializeTabs() {
        let tabs: [WCTopBarItem] = [
            .init(iconName: "",
                  title: "Fecha",
                  destination: CalendarTabRoute(isPresented: .constant(false)).build()),
            .init(iconName: "",
                  title: "Hora",
                  destination: VideocallTimeTabRoute(isPresented: .constant(false)).build())
        ]
        tabBarItems = tabs
        tabSelection = tabs[0]
    }
}