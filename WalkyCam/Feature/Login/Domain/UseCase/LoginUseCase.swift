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

    private static func configure(
        loginResponse: UserDataResponse,
        in session: UserSessionProtocol
    ) throws -> LoginOutput {
        do {
            let loginOutput = LoginOutput(
                id: loginResponse.user.id,
                userName: loginResponse.user.userName,
                name: loginResponse.user.name,
                lastName: loginResponse.user.lastName,
                email: loginResponse.user.email,
                address: loginResponse.user.address,
                configurations: .init(
                    streetCam: loginResponse.streetCamConfiguration.onboardingReaded,
                    scan3D: loginResponse.scan3dConfiguration.onboardingReaded,
                    videoCall: loginResponse.videoCallConfiguration.onboardingReaded,
                    ARHands: loginResponse.arHandsConfiguration.onboardingReaded,
                    digitalTwins: loginResponse.digitalTwinsConfiguration.onboardingReaded,
                    drone: loginResponse.droneCamConfiguration.onboardingReaded
                )
            )

            try session.save(user: loginOutput.asUserSessionData())

            return loginOutput
        } catch {
            throw error
        }
    }
}

extension LoginOutput {
    func asUserSessionData() -> UserSessionData {
        return UserSessionData(
            id: id,
            userName: userName,
            name: name,
            lastName: lastName,
            email: email,
            address: address,
            configurations: .init(
                streetCam: configurations.streetCam,
                scan3D: configurations.scan3D,
                videoCall: configurations.videoCall,
                ARHands: configurations.ARHands,
                digitalTwins: configurations.digitalTwins,
                drone: configurations.drone
            )
        )
    }
}
