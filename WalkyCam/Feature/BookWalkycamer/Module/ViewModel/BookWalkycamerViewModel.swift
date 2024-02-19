import SwiftUI

final class BookWalkycamerViewModel: BookWalkycamerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: BookWalkycamerInteractorProtocol
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var tabBarItems: [WCTopBarItem] = []

    // MARK: - Initialization

    init(interactor: BookWalkycamerInteractorProtocol = BookWalkycamerInteractor()) {
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
                  destination: TimeTabRoute(isPresented: .constant(false)).build()),
            .init(iconName: "",
                  title: "Área",
                  destination: MapTabRoute(isPresented: .constant(false)).build())
        ]
        tabBarItems = tabs
        tabSelection = tabs[0]
    }
}
