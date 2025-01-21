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
        return StreetcammerManager.shared.streetCammers
    }
}
