//
//  FetchUserConfigurationsUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Foundation
import Networking
import Combine

typealias FetchUserConfigurationsUseCase = GenericUseCase<String, Void>

extension FetchUserConfigurationsUseCase {

    static func fetchConfigurations(
        repository: ConfigurationRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    let dispatchGroup = DispatchGroup()
                    var configurations: [String:Bool] = [:]

                    repository.getStreetCamConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["street_cam"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    repository.getScan3DConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["scan3d"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    repository.getVideoCallConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["videocall"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    repository.getARHandsConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["arhands"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    repository.getDigitalTwinsCamConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["digital_twins"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    repository.getDroneConfiguration(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            configurations["drone"] = response.configuration.onboardingReaded
                            dispatchGroup.leave()
                        }
                    }

                    dispatchGroup.notify(queue: .main) {
                        // salvar no user session
                        do {
                            let output: Void = try saveToUserSession(
                                data: configurations,
                                in: userSession
                            )
                            promise(.success(output))
                        } catch {
                            promise(.failure(error))
                        }
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func saveToUserSession(
        data: [String: Bool],
        in session: UserSessionProtocol
    ) throws -> Void {
        do {
            let configurations = UserSessionData.Configurations(
                streetCam: data["street_cam"] ?? false,
                scan3D: data["scan3d"] ?? false,
                videoCall: data["videocall"] ?? false,
                ARHands: data["arhands"] ?? false,
                digitalTwins: data["digital_twins"] ?? false,
                drone: data["drone"] ?? false
            )
            var user = try session.user()
            user.configurations = configurations
            try session.save(user: user)
            return
        } catch {
            throw error
        }
    }
}
