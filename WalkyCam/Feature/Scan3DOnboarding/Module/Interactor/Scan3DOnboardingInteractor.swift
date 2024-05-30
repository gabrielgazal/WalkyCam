import Combine

final class Scan3DOnboardingInteractor: Scan3DOnboardingInteractorProtocol {
    
    // MARK: - Inner Types
    
    struct UseCases {
        let updateScan3DConfiguration: UpdateScan3DConfigurationUseCase
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
            useCases.updateScan3DConfiguration()
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
