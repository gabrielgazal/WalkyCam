import Combine
import MapKit
import CoreLocation

final class MapTabInteractor: MapTabInteractorProtocol {

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
        return StreetcammerManager.shared.streetCammers
    }
}
