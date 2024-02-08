//
//  TabBarInteractor.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Combine

final class TabBarInteractor: TabBarInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let fetchConfigurations: FetchUserConfigurationsUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func getUserConfigurations(id: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.fetchConfigurations(id)
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
