import Combine

final class ServiceConfirmationInteractor: ServiceConfirmationInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let saveVideoCall: ScheduleVideoCallUseCase
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
    
    func saveVideoCall() async throws -> String {
        let callId = ServiceInformationManager.shared.getServiceBasicInformation().callId
        return try await withCheckedThrowingContinuation { continuation in
            useCases.saveVideoCall(callId)
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
