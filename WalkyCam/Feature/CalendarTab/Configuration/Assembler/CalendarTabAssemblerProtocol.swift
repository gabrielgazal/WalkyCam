import SwiftUI

protocol CalendarTabAssemblerProtocol {
    func resolveView(
        route: CalendarTabRoute
    ) -> CalendarTabView<CalendarTabViewModel, CalendarTabRouter>
}