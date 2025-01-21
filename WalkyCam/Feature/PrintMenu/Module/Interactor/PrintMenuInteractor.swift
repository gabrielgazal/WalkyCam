import Combine

final class PrintMenuInteractor: PrintMenuInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let fetchUserFiles: FetchUserFilesUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func fetchGalleryItems() async throws -> [GalleryItemModel] {
        let userId = try UserSession().user().id
        
        return try await withCheckedThrowingContinuation { continuation in
            useCases.fetchUserFiles(userId)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished: break
                        }
                    },
                    receiveValue: { plans in
                        continuation.resume(returning: plans)
                    }
                )
                .store(in: &bag)
        }
    }
}
