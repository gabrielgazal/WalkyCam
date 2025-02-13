import Combine

final class WalkyBotInteractor: WalkyBotInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let getUserChatId: GetUserChatIdUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func getUserChatId(userId: String) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.getUserChatId(userId)
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
