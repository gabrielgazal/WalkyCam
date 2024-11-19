import Combine

final class Video3DScannerInteractor: Video3DScannerInteractorProtocol {

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

    #warning("Example function. Rename or remove it")
    func someFunction() {

    }
}
