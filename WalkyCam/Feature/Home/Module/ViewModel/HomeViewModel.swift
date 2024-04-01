import SwiftUI

// swiftlint:disable line_length
final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Dependencies

    @Published var homeData: HomeModel = .init()
    private let interactor: HomeInteractorProtocol

    // MARK: - Initialization

    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
        self.updateData()
    }

    // MARK: - Private Methods

    private func updateData() {
        Task {
            await fetchProfileData()
        }
        fetchRecentFunctions()
        fetchReminders()
        fetchNews()
        fetchFavorites()
        fetchFiles()
    }

    @MainActor private func fetchProfileData() async {
        let user = await interactor.fetchProfileData()
        homeData.profileInfo = .init(name: user.name,
                                     imageURL: .imageMock)
    }

    private func fetchRecentFunctions() {
        homeData.recentFunctions = [
            .init(id: 0, title: "Video Call", icon: Asset.Icons.videoCall.name),
            .init(id: 1, title: "Street Cam", icon: Asset.Icons.streetCam.name),
            .init(id: 2, title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(id: 3, title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(id: 4, title: "Drone Fly", icon: Asset.Icons.drone.name),
            .init(id: 5, title: "Más", icon: Asset.TabBar.grid.name)
        ]
    }

    private func fetchReminders() {
        homeData.reminders = [
            .init(id: 0, date: "Hoy - 13:00 h.", camerName: "Diego Salas"),
            .init(id: 0, date: "30 Oct 2023 - 10:00 h.", camerName: "Camila Cabello")
        ]
    }

    private func fetchNews() {
        homeData.news = [
            .init(id: 0, title: "Falló tu conexión con SAP", description: "Tienes las credenciales caducadas.", icon: Asset.Icons.crm.name),
            .init(id: 0, title: "WALKY te ayuda con tu IOT", description: "Debes calibrar los sensores regularmente.", icon: Asset.Icons.iot.name),
            .init(id: 0, title: "", description: "Recuerda que tu plan de vuelo es solo para Cajamarca. Caduca hoy a   las 20:00 h.", icon: Asset.Icons.drone.name)
        ]
    }

    private func fetchFavorites() {
        homeData.favorites = [
            .init(id: 0, name: "Lali Espósito", imageUrl: .womanMock1, stars: 4, location: "Bogotá, Colombia", technologies: [.drone, .scan, .smartphone]),
            .init(id: 0, name: "Diego Salas", imageUrl: .manMock1, stars: 4, location: "CDMX, México", technologies: [.drone, .smartphone]),
            .init(id: 0, name: "Thiago Guirao", imageUrl: .manMock2, stars: 5, location: "Mar del Plata, Argentina", technologies: [.drone, .scan, .smartphone])
        ]
    }

    private func fetchFiles() {
        homeData.files = [
            .init(id: 0, title: "Mis escaneos 3D", icon: Asset.Icons.scan3D.name),
            .init(id: 0, title: "Mis videos WalkCamer", icon: Asset.Icons.streetCam.name),
            .init(id: 0, title: "Mis servicios IOT", icon: Asset.Icons.iot.name),
            .init(id: 0, title: "Mis videos Drone", icon: Asset.Icons.drone.name)
        ]
    }
}
