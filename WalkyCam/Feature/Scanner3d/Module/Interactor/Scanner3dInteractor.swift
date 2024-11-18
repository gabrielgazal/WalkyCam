import Combine
import Foundation

final class Scanner3dInteractor: Scanner3dInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let scan3dFromVideo: Scan3dFromVideoUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func generateModelFromVideo(input: Data) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.scan3dFromVideo(input)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let failure):
                        continuation.resume(with: .failure(failure))
                    }
                },
                receiveValue: { _ in
                    continuation.resume()
                }
            )
            .store(in: &bag)
        }
    }
}
