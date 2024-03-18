import Combine

final class RegistrationPlansInteractor: RegistrationPlansInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let fetchAllPlans: FetchAvailablePlansUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func fetchAvailablePlans() async throws -> [AvailablePlanData] {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.fetchAllPlans()
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished: break
                        }
                    },
                    receiveValue: { plans in
                        continuation.resume(returning: plans)
                    }
                )
                .store(in: &bag)
        }
    }
}
