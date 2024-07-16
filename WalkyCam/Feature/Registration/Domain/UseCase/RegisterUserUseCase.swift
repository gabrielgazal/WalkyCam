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
        repository: AuthRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
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

    private static func configure(
        loginResponse: UserResponse,
        in session: UserSessionProtocol
    ) throws -> RegistrationOutput {
        do {
            let registrationOutput = RegistrationOutput(id: loginResponse.id,
                                          userName: loginResponse.userName,
                                          name: loginResponse.name,
                                          lastName: loginResponse.lastName,
                                          email: loginResponse.email,
                                          address: loginResponse.address)

            try session.save(user: registrationOutput.asUserSessionData())

            return registrationOutput
        } catch {
            throw error
        }
    }
}


extension RegistrationOutput {
    func asUserSessionData() -> UserSessionData {
        return UserSessionData(id: id,
                               userName: userName,
                               name: name,
                               lastName: lastName,
                               email: email,
                               address: address,
                               configurations: .init(),
                               plan: .init())
    }
}
