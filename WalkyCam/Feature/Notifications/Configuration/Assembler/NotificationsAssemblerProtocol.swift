import SwiftUI

protocol NotificationsAssemblerProtocol {
    func resolveView(
        route: NotificationsRoute
    ) -> NotificationsView<NotificationsViewModel, NotificationsRouter>
}