import Combine
import MapKit
import CoreLocation

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
        let coordinates = generateNearbyCoordinates(from: location)

        return [
            .init(
                id: 0,
                name: "Camila Pérez",
                stars: 5,
                description: "*4 min* de distancia - Desde $6",
                profileImage: .imageMock,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: coordinates[0]
            ),
            .init(
                id: 1,
                name: "Lali Espósito",
                stars: 4,
                description: "*16 min* de distancia - Desde $4",
                profileImage: .imageMock,
                technologies: [.scan, .smartphone],
                coordinates: coordinates[1]
            ),
            .init(
                id: 2,
                name: "Diego Salas",
                stars: 4,
                description: "*4 min* de distancia - Desde %6",
                profileImage: .imageMock,
                technologies: [.drone, .smartphone],
                coordinates: coordinates[2]
            ),
            .init(
                id: 3,
                name: "Maria Casas",
                stars: 5,
                description: "*4 min* de distancia - Desde %6",
                profileImage: .imageMock,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: coordinates[3]
            ),
            .init(id: 4,

                  name: "Camila Pérez",
                  stars: 3,
                  description: "*4 min* de distancia - Desde %6",
                  profileImage: .imageMock,
                  technologies: [.drone],
                  coordinates: coordinates[4]
                 )
        ]
    }

    func generateNearbyCoordinates(from coordinate: CLLocationCoordinate2D) -> [Coordinate] {
        var nearbyCoordinates: [Coordinate] = []
        let maxDistance: Double = 0.001
        for _ in 1...5 {
            let latOffset = (Double(arc4random_uniform(1000)) - 500) * maxDistance / 100.0
            let lonOffset = (Double(arc4random_uniform(1000)) - 500) * maxDistance / 100.0
            let newLatitude = coordinate.latitude + latOffset
            let newLongitude = coordinate.longitude + lonOffset
            let newCoordinate = Coordinate(latitude: newLatitude, longitude: newLongitude)
            nearbyCoordinates.append(newCoordinate)
        }
        return nearbyCoordinates
    }
}
