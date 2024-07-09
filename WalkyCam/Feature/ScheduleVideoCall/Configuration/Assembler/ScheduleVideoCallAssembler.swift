import SwiftUI

final class ScheduleVideoCallAssembler: ScheduleVideoCallAssemblerProtocol {
    func resolveView(
        route: ScheduleVideoCallRoute
    ) -> ScheduleVideoCallView<ScheduleVideoCallViewModel, ScheduleVideoCallRouter> {

        let router = ScheduleVideoCallRouter(isPresented: route.isPresented)

        let interactor = ScheduleVideoCallInteractor(
            useCases: .init()
        )
        let viewModel = ScheduleVideoCallViewModel(interactor: interactor)
        let view = ScheduleVideoCallView(viewModel: viewModel, router: router)

        return view
    }
}
