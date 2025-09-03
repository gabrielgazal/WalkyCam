//
//  ResetPasswordUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 02/09/25.
//

import Foundation
import Networking
import Combine

typealias ResetPasswordUseCase = GenericUseCase<String, Void>

extension ResetPasswordUseCase {
    
    static func live(
        repository: AuthRepositoryProtocol
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.resetPassword(email: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(response))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
