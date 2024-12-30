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
        let getNearWalkyCammers: GetNearWalkyCammersUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    func fetchStreetcammers() async throws -> [CammerData] {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.getNearWalkyCammers("")
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            continuation.resume(throwing: error)
                        case .finished:
                            break
                        }
                    },
                    receiveValue: { cammers in
                        continuation.resume(returning: cammers)
                    }
                )
                .store(in: &bag)
        }
    }
}
