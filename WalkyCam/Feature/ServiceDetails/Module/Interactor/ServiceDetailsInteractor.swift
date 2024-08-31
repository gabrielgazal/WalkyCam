import Combine

final class ServiceDetailsInteractor: ServiceDetailsInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let updateVideoCall: UpdateVideoCallUseCase
        let cancelVideoCall: CancelVideoCallUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func updateVideoCall(_ data: UpdateVideoCallInput) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.updateVideoCall(data)
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
    
    func cancelVideoCall() async throws -> Void {
        let callId = ServiceInformationManager.shared.getServiceBasicInformation().callId
        return try await withCheckedThrowingContinuation { continuation in
            useCases.cancelVideoCall(callId)
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
