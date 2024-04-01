import Combine

final class WalkyCammerListInteractor: WalkyCammerListInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases = UseCases()) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func getCammersOnLocation() -> [CammerData] {
        return [
            .init(
                id: 0,
                name: "Camila Pérez",
                stars: 5,
                description: "*4 min* de distancia - Desde $6",
                profileImage: .womanMock2,
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
                profileImage: .womanMock2,
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
                profileImage: .manMock3,
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
                  profileImage: .manMock1,
                  technologies: [.drone],
                  coordinates: .init(
                    latitude: -25.430924,
                    longitude: -49.2272714
                  )
                 ),

        ]
    }
}
