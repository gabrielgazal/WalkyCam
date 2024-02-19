import SwiftUI

final class CalendarTabAssembler: CalendarTabAssemblerProtocol {
    func resolveView(
        route: CalendarTabRoute
    ) -> CalendarTabView<CalendarTabViewModel, CalendarTabRouter> {

        let router = CalendarTabRouter(isPresented: route.isPresented)

        let interactor = CalendarTabInteractor(
            useCases: .init()
        )
        let viewModel = CalendarTabViewModel(interactor: interactor)
        let view = CalendarTabView(viewModel: viewModel, router: router)

        return view
    }
}
