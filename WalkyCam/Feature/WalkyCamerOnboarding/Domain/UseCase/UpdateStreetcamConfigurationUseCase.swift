//
//  UpdateStreetcamConfigurationUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation
import Networking
import Combine

typealias UpdateStreetcamConfigurationUseCase = GenericUseCase<String, Void>

extension UpdateStreetcamConfigurationUseCase {

    static func updateStreetCam(
        repository: ConfigurationRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in

                    repository.getStreetCamConfiguration(userId: input) { result in
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
            user.configurations?.streetCam = true
            try session.save(user: user)
            return
        } catch {
            throw error
        }
    }
}