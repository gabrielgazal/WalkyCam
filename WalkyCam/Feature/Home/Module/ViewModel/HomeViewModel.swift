import SwiftUI

// swiftlint:disable line_length
final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Dependencies

    @Published var homeData: HomeModel = .init()
    private let interactor: HomeInteractorProtocol

    // MARK: - Initialization

    init(interactor: HomeInteractorProtocol = HomeInteractor()) {
        self.interactor = interactor
        self.updateData()
    }

    // MARK: - Private Methods

    private func updateData() {
        fetchProfileData()
        fetchRecentFunctions()
        fetchReminders()
    }

    private func fetchProfileData() {
        homeData.profileInfo = .init(name: "Andrea",
                                     imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpegadanatural.com.br%2Fblog%2F3-maneiras-de-cuidar-do-seu-filhote-de-cachorro-com-qualidade%2F&psig=AOvVaw2JCtseK9RuAqFkYMCATdIA&ust=1697568786927000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCztdae-4EDFQAAAAAdAAAAABAI")
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
}
