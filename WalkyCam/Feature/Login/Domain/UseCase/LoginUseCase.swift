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
    
    static func live(
        repository: AuthRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.login(userName: credentials.userName,
                                     password: credentials.password) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            do {
                                let output = try configure(
                                    loginResponse: response,
                                    in: userSession
                                )
                                promise(.success(output))
                            } catch {
                                promise(.failure(error))
                            }
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func mapResponseToResult(_ data: UserResponse) -> LoginOutput {
        return .init(id: data.id,
                     userName: data.userName,
                     name: data.name,
                     lastName: data.lastName,
                     email: data.email,
                     address: data.address)
    }

    private static func configure(
        loginResponse: UserResponse,
        in session: UserSessionProtocol
    ) throws -> LoginOutput {
        do {
            let loginOutput = LoginOutput(id: loginResponse.id,
                                          userName: loginResponse.userName,
                                          name: loginResponse.name,
                                          lastName: loginResponse.lastName,
                                          email: loginResponse.email,
                                          address: loginResponse.address)

            try session.save(user: loginOutput.asUserSessionData())

            return loginOutput
        } catch {
            throw error
        }
    }
}

extension LoginOutput {
    func asUserSessionData() -> UserSessionData {
        return UserSessionData(id: id,
                               userName: userName,
                               name: name,
                               lastName: lastName,
                               email: email,
                               address: address)
    }
}
