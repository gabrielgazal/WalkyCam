import Combine
import MapKit

final class SearchWalkyCammerInteractor: SearchWalkyCammerInteractorProtocol {

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

    func getCammersOnLocation(location: CLLocationCoordinate2D) -> [CammerData] {
        return [
            .init(id: 0,
                  name: "Camila Pérez",
                  stars: 5,
                  description: "*4 min* de distancia - Desde $6",
                  profileImage: .imageMock,
                  technologies: [.scan, .smartphone, .video, .camera]),
            .init(id: 1,
                  name: "Lali Espósito",
                  stars: 4,
                  description: "*16 min* de distancia - Desde $4",
                  profileImage: .imageMock,
                  technologies: [.scan, .smartphone]),
            .init(id: 2,
                  name: "Diego Salas",
                  stars: 4,
                  description: "*4 min* de distancia - Desde %6",
                  profileImage: .imageMock,
                  technologies: [.drone, .smartphone]),
            .init(id: 3,
                  name: "Maria Casas",
                  stars: 5,
                  description: "*4 min* de distancia - Desde %6",
                  profileImage: .imageMock,
                  technologies: [.scan, .smartphone, .video, .camera]),
            .init(id: 4,
                  name: "Camila Pérez",
                  stars: 3,
                  description: "*4 min* de distancia - Desde %6",
                  profileImage: .imageMock,
                  technologies: [.drone]),

        ]
    }
}
