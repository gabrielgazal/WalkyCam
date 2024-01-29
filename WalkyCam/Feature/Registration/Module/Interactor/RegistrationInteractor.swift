import Combine

final class RegistrationInteractor: RegistrationInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let registerUseCase: RegisterUserUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func register(with input: RegistrationInput) async throws -> RegistrationOutput {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.registerUseCase(input)
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
}
