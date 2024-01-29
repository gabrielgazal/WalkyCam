import Combine

final class HomeInteractor: HomeInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let fetchUserHeaderDataUseCase: FetchUserHeaderDataUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func fetchProfileData() async -> ProfileData {
        return await withCheckedContinuation { continuation in
            useCases.fetchUserHeaderDataUseCase()
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { data in
                        continuation.resume(returning: data)
                    }
                )
                .store(in: &bag)
        }
    }
}
