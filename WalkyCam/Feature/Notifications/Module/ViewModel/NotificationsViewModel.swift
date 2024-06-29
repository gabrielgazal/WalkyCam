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
            .init(image: "",
                  title: nil,
                  description: "Has reservado un WalkCamer para el día **24 Sept 22 a las 15:00 h.**",
                  date: .init(),
                  backgroundColor: Color.blancoGris),
            .init(image: .womanMock2,
                  title: "Esperanza Stonen",
                  description: "Te ha dejado **4 estrellas.**",
                  date: .init(timeIntervalSinceNow: -10000000),
                  backgroundColor: Color.blanco),
            .init(image: "",
                  title: nil,
                  description: "Queda **pendiente el pago** de $6, por servicio Drone.",
                  date: .init(timeIntervalSinceNow: -30000000),
                  backgroundColor: Color.blanco),
            .init(image: .womanMock3,
                  title: "Camila Pérez",
                  description: "Le otorgó acceso a la sala",
                  date: .now,
                  backgroundColor: Color.blancoGris)
        ]
    }
}
// swiftlint:enable line_length
