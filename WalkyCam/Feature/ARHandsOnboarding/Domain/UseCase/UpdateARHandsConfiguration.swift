//
//  UpdateARHandsConfiguration.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/05/24.
//

import Foundation
import Networking
import Combine

typealias UpdateARHandsConfigurationUseCase = GenericUseCase<Void, Void>

extension UpdateARHandsConfigurationUseCase {

    static func updateARHands(
        repository: ConfigurationRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    let userId = try? userSession.user().id
                    repository.updateARHandsConfiguration(userId: userId ?? "") { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case .success:
                            do {
                                let output: Void = try saveToUserSession(in: userSession)
                                promise(.success(output))
                            } catch {
                                promise(.failure(error))
                            }
                        }
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func saveToUserSession(
        in session: UserSessionProtocol
    ) throws -> Void {
        do {
            var user = try session.user()
            user.configurations.arHandsConfiguration = true
            try session.save(user: user)
            return
        } catch {
            throw error
        }
    }
}
