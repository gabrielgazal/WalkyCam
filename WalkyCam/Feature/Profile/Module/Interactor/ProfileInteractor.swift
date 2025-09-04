import Combine

final class ProfileInteractor: ProfileInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let fetchUserDataUseCase: FetchUserDataUseCase
        let updateInfo: UpdateUserInfoUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func fetchUserData() async -> UserSessionData {
        return await withCheckedContinuation { continuation in
            useCases.fetchUserDataUseCase()
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { data in
                        continuation.resume(returning: data)
                    }
                )
                .store(in: &bag)
        }
    }
    
    func updateUserData(_ user: UserData) async throws -> UserData {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.updateInfo(user)
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { data in
                        continuation.resume(returning: data)
                    }
                )
                .store(in: &bag)
        }
    }
}
