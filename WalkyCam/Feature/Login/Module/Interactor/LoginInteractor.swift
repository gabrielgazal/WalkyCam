//
//  LoginInteractor.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

import Combine

final class LoginInteractor: LoginInteractorProtocol {

    // MARK: - Inner Types

    struct UseCases {
        let login: LoginUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func login(with input: LoginInput) async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            useCases.login(input)
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
