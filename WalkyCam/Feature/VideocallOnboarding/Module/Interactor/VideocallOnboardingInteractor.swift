import Combine

final class VideocallOnboardingInteractor: VideocallOnboardingInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let updateStreetcamConfiguration: UpdateStreetcamConfigurationUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

     func updateUserConfiguration() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.updateStreetcamConfiguration("")
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished:
                            break
                        }
                    },
                    receiveValue: { result in
                        continuation.resume()
                    }
                )
                .store(in: &bag)
        }
    }
}
