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
        let gerUserPlan: GetUserPlanUseCase
    }

    // MARK: - Dependencies

    private let useCases: UseCases
    private var bag = Set<AnyCancellable>()

    // MARK: - Initialization

    init(useCases: UseCases) {
        self.useCases = useCases
    }

    // MARK: - Public API

    func login(with input: LoginInput) async throws -> LoginOutput {
        return try await withCheckedThrowingContinuation { continuation in
//            Publishers.Zip(
//                useCases.login(input),
//                useCases.gerUserPlan(input)
//            )
            useCases.login(input)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let failure):
                        continuation.resume(with: .failure(failure))
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
