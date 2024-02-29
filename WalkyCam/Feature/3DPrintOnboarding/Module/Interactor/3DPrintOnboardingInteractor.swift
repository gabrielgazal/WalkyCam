import Combine

final class _DPrintOnboardingInteractor: _DPrintOnboardingInteractorProtocol {

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
