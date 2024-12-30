import Combine
import MapKit
import CoreLocation

final class SearchWalkyCammerInteractor: SearchWalkyCammerInteractorProtocol {
    
    // MARK: - Inner Types
    
    struct UseCases {
        let getNearWalkyCammers: GetNearWalkyCammersUseCase
    }
    
    // MARK: - Dependencies
    
    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    // MARK: - Public API
    
    func getCammersOnLocation(location: CLLocationCoordinate2D) async throws -> [CammerData] {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.getNearWalkyCammers(location)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished:
                            break
                        }
                    },
                    receiveValue: { user in
                        continuation.resume(returning: user)
                    }
                )
                .store(in: &bag)
        }
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
