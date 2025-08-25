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
                                     imageURL: user.imageURL)
    }

    private func fetchRecentFunctions() {
        homeData.recentFunctions = [
            .init(id: 0, title: L10n.HomeViewModel.RecentFunctions.VideoCall.title, icon: Asset.Icons.videoCall.name),
            .init(id: 1, title: L10n.HomeViewModel.RecentFunctions.StreetCam.title, icon: Asset.Icons.streetCam.name),
            .init(id: 2, title: L10n.HomeViewModel.RecentFunctions.Scan3D.title, icon: Asset.Icons.scan3D.name),
            .init(id: 3, title: L10n.HomeViewModel.RecentFunctions.ArHands.title, icon: Asset.Icons.ar.name),
            .init(id: 4, title: L10n.HomeViewModel.RecentFunctions.DroneFly.title, icon: Asset.Icons.drone.name),
            .init(id: 5, title: L10n.HomeViewModel.RecentFunctions.Mas.title, icon: Asset.TabBar.grid.name)
        ]
    }

    private func fetchReminders() {
        homeData.reminders = [
            .init(id: 0, date: L10n.HomeViewModel.Reminders.Hoy.date, camerName: L10n.HomeViewModel.Favorites.Diego.name),
            .init(id: 0, date: L10n.HomeViewModel.Reminders.Camila.date, camerName: L10n.HomeViewModel.Favorites.Camila.name)
        ]
    }

    private func fetchNews() {
        homeData.news = [
            .init(id: 0, title: L10n.HomeViewModel.News.Sap.title, description: L10n.HomeViewModel.News.Sap.description, icon: Asset.Icons.crm.name),
            .init(id: 0, title: L10n.HomeViewModel.News.Iot.title, description: L10n.HomeViewModel.News.Iot.description, icon: Asset.Icons.iot.name),
            .init(id: 0, title: "", description: L10n.HomeViewModel.News.Drone.description, icon: Asset.Icons.drone.name)
        ]
    }

    private func fetchFavorites() {
        homeData.favorites = [
            .init(id: 0, name: L10n.HomeViewModel.Favorites.Lali.name, imageUrl: .womanMock1, stars: 4, location: L10n.HomeViewModel.Favorites.Bogota.location, technologies: [.drone, .scan, .smartphone]),
            .init(id: 0, name: L10n.HomeViewModel.Favorites.Diego.name, imageUrl: .manMock1, stars: 4, location: L10n.HomeViewModel.Favorites.Cdmx.location, technologies: [.drone, .smartphone]),
            .init(id: 0, name: L10n.HomeViewModel.Favorites.Thiago.name, imageUrl: .manMock2, stars: 5, location: L10n.HomeViewModel.Favorites.MarDelPlata.location, technologies: [.drone, .scan, .smartphone])
        ]
    }

    private func fetchFiles() {
        homeData.files = [
            .init(id: 0, title: L10n.HomeViewModel.Files.Scan3D.title, icon: Asset.Icons.scan3D.name),
            .init(id: 0, title: L10n.HomeViewModel.Files.WalkCamer.title, icon: Asset.Icons.streetCam.name),
            .init(id: 0, title: L10n.HomeViewModel.Files.Iot.title, icon: Asset.Icons.iot.name),
            .init(id: 0, title: L10n.HomeViewModel.Files.Drone.title, icon: Asset.Icons.drone.name)
        ]
    }
}
