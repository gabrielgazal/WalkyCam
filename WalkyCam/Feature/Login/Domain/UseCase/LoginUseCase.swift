//
//  LoginUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

import Foundation
import Networking
import Combine

typealias LoginUseCase = GenericUseCase<LoginInput, LoginOutput>

extension LoginUseCase {

    static func live(repository: AuthRepositoryProtocol) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.login(userName: credentials.userName,
                                     password: credentials.password) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(
                                .success(mapResponseToResult(response))
                            )
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func mapResponseToResult(_ data: Networking.UserData) -> LoginOutput {
        return .init(id: data.id,
                     userName: data.userName,
                     name: data.name,
                     lastName: data.lastName,
                     email: data.email,
                     address: data.address)
    }
}
