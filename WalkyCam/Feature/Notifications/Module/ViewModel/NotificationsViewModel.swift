import SwiftUI

final class NotificationsViewModel: NotificationsViewModelProtocol {
    // swiftlint:disable line_length
    // MARK: - Dependencies
    @Published var notifications: [NotificationModel] = []

    private let interactor: NotificationsInteractorProtocol

    // MARK: - Initialization

    init(interactor: NotificationsInteractorProtocol = NotificationsInteractor()) {
        self.interactor = interactor
        fetchNotifications()
    }

    // MARK: - Private Methods

    private func fetchNotifications() {
        notifications = [
            .init(image: Asset.Icons.drone.name,
                  title: "Teste de notif",
                  description: "Esse aqui é um teste de *notificação*",
                  date: .init(),
                  backgroundColor: Color.blancoGris),
            .init(image: Asset.Icons.drone.name,
                  title: "Teste de notif",
                  description: "Esse aqui é um teste de *notificação*",
                  date: .distantPast,
                  backgroundColor: Color.blancoGris),
            .init(image: Asset.Icons.drone.name,
                  title: "Teste de notif",
                  description: "Esse aqui é um teste de *notificação*",
                  date: .init(timeIntervalSinceNow: -30000000),
                  backgroundColor: Color.blancoGris),
            .init(image: Asset.Icons.drone.name,
                  title: "Teste de notif",
                  description: "Esse aqui é um teste de *notificação*",
                  date: .now,
                  backgroundColor: Color.blancoGris)
        ]
    }
}
// swiftlint:enable line_length
