import Combine

final class LegalDocumentationInteractor: LegalDocumentationInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let convertCammer: ConvertWalkcamerUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func updateUserData(_ user: CamerRegistrationData) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.convertCammer(user)
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { data in
                        continuation.resume()
                    }
                )
                .store(in: &bag)
        }
    }
}
