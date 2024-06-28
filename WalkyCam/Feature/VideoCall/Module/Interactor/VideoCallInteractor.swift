import Combine

final class VideoCallInteractor: VideoCallInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let createVideoCall: CreateVideoCallUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func createVideoCall() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.createVideoCall()
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
