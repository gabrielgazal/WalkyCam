import SwiftUI

protocol ScheduleVideoCallAssemblerProtocol {
    func resolveView(
        route: ScheduleVideoCallRoute
    ) -> ScheduleVideoCallView<ScheduleVideoCallViewModel, ScheduleVideoCallRouter>
}