import SwiftUI

final class AvailableAssistantsViewModel: AvailableAssistantsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailableAssistantsInteractorProtocol
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: AvailableAssistantsInteractorProtocol = AvailableAssistantsInteractor()) {
        self.interactor = interactor
        getWalkyCammers()
    }

    // MARK: - Public API

    private func getWalkyCammers() {
        walkyCammers = .loading
        let cammers: [CammerData] = [
            .init(
                id: 0,
                name: "Camila Pérez",
                stars: 5,
                description: "*4 min* de distancia - Desde $6",
                profileImage: .womanMock1,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: .init(
                    latitude: -25.4300744,
                    longitude: -49.2717098
                )
            ),
            .init(
                id: 1,
                name: "Lali Espósito",
                stars: 4,
                description: "*16 min* de distancia - Desde $4",
                profileImage: .womanMock3,
                technologies: [.scan, .smartphone],
                coordinates: .init(
                    latitude: -25.426678,
                    longitude: -49.272280
                )
            ),
            .init(
                id: 2,
                name: "Diego Salas",
                stars: 4,
                description: "*4 min* de distancia - Desde %6",
                profileImage: .manMock2,
                technologies: [.drone, .smartphone],
                coordinates: .init(
                    latitude: -25.431048,
                    longitude: -49.271921
                )
            ),
            .init(
                id: 3,
                name: "Maria Casas",
                stars: 5,
                description: "*4 min* de distancia - Desde %6",
                profileImage: .womanMock4,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: .init(
                    latitude: -25.429866,
                    longitude: -49.270048
                )
            ),
            .init(id: 4,

                  name: "Gabriel Silva",
                  stars: 3,
                  description: "*4 min* de distancia - Desde %6",
                  profileImage: .manMock4,
                  technologies: [.drone],
                  coordinates: .init(
                    latitude: -25.430924,
                    longitude: -49.2272714
                  )
                 ),

        ]
        walkyCammers = .loaded(cammers)
    }

}
