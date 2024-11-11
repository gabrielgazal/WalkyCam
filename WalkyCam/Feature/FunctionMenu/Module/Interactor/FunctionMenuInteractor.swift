import Combine

final class FunctionMenuInteractor: FunctionMenuInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let startCreate: StartStreetcamUseCase
        let startSchedule: StartStreetcamUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func startCreation() async throws -> VideoCallOutput {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return try await withCheckedThrowingContinuation { continuation in
            useCases.startCreate(userId)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let failure):
                            continuation.resume(throwing: failure)
                        }
                    },
                    receiveValue: { streetcam in
                        continuation.resume(returning: streetcam)
                    }
                )
                .store(in: &bag)
        }
    }
    func startSchedule() async throws -> VideoCallOutput {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return try await withCheckedThrowingContinuation { continuation in
            useCases.startSchedule(userId)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let failure):
                            continuation.resume(throwing: failure)
                        }
                    },
                    receiveValue: { streetcam in
                        continuation.resume(returning: streetcam)
                    }
                )
                .store(in: &bag)
        }
    }
}
