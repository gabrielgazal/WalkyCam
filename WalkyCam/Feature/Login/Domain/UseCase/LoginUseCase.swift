//
//  LoginUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

import Foundation
import Networking
import Combine

typealias LoginUseCase = GenericUseCase<LoginInput, Bool>

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
                                .success(response)
                            )
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
