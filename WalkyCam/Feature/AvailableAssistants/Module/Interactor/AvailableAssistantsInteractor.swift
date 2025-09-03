import Combine
import CoreLocation

final class AvailableAssistantsInteractor: AvailableAssistantsInteractorProtocol {

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
            useCases.getNearWalkyCammers(
                SearchWalkyCammerModel(
                    latitude: location.latitude,
                    longitude: location.longitude
                )
            )
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished:
                            break
                        }
                    },
                    receiveValue: { cammers in
                        continuation.resume(returning: cammers)
                    }
                )
                .store(in: &bag)
        }
    }
}
