//
//  RegisterUserUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

import Foundation
import Networking
import Combine

typealias RegisterUserUseCase = GenericUseCase<RegistrationInput, RegistrationOutput>

extension RegisterUserUseCase {

    static func live(
        repository: AuthRepositoryProtocol
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.register(name: credentials.name,
                                        lastName: credentials.lastName,
                                        userName: credentials.userName,
                                        email: credentials.email,
                                        password: credentials.password) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(mapResponseToResult(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func mapResponseToResult(_ data: UserResponse) -> RegistrationOutput {
        return .init(id: data.id,
                     userName: data.userName,
                     name: data.name,
                     lastName: data.lastName,
                     email: data.email,
                     address: data.address)
    }
}
