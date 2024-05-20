import Combine

final class StreetCamMenuInteractor: StreetCamMenuInteractorProtocol {
    
    // MARK: - Inner Types
    
    struct UseCases {
        let startCreateStreetcam: StartStreetcamUseCase
        let startScheduleStreetcam: StartStreetcamUseCase
    }
    
    // MARK: - Dependencies
    
    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    // MARK: - Public API
    
    func startCreationStreetcam() async throws -> VideoCallOutput {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return try await withCheckedThrowingContinuation { continuation in
            useCases.startCreateStreetcam(userId)
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
    
    func startScheduleStreetcam() async throws -> VideoCallOutput {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return try await withCheckedThrowingContinuation { continuation in
            useCases.startScheduleStreetcam(userId)
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
