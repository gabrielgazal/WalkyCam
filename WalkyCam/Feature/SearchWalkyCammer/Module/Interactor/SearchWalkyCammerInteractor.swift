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
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock3,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: coordinates[0],
                devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                ],
                availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                ),
                abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: 1,
                name: "Lali Espósito",
                stars: 4,
                description: "*16 min* de distancia - Desde $4",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock2,
                technologies: [.scan, .smartphone],
                coordinates: coordinates[1],
                devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                ],
                availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                ),
                abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: 2,
                name: "Diego Salas",
                stars: 4,
                description: "*4 min* de distancia - Desde %6",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .manMock2,
                technologies: [.drone, .smartphone],
                coordinates: coordinates[2],
                devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                ],
                availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                ),
                abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: 3,
                name: "Maria Casas",
                stars: 5,
                description: "*4 min* de distancia - Desde %6",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock1,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: coordinates[3],
                devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                ],
                availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                ),
                abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(id: 4,
                  name: "Gabriel Silva",
                  stars: 3,
                  description: "*4 min* de distancia - Desde %6",
                  about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                  profileImage: .manMock1,
                  technologies: [.drone],
                  coordinates: coordinates[4],
                  devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                  ],
                  availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                  ),
                  abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                  ]
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
