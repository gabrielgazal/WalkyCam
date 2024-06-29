//
//  UpdateScan3DConfigurationUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation
import Networking
import Combine

typealias UpdateScan3DConfigurationUseCase = GenericUseCase<Void, Void>

extension UpdateScan3DConfigurationUseCase {

    static func updateScan3D(
        repository: ConfigurationRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    let userId = try? userSession.user().id
                    repository.updateScan3DConfiguration(userId: userId ?? "") { result in
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
            user.configurations.scan3dConfiguration = true
            try session.save(user: user)
            return
        } catch {
            throw error
        }
    }
}
