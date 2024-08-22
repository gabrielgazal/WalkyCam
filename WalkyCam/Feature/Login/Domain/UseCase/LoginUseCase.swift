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
        loginResponse: UserResponse,
        in session: UserSessionProtocol
    ) throws -> LoginOutput {
        do {
            let loginOutput = LoginOutput(
                id: loginResponse.id,
                userName: loginResponse.userName,
                name: loginResponse.name,
                lastName: loginResponse.lastName,
                email: loginResponse.email,
                address: loginResponse.address,
                phone: loginResponse.phone,
                birthDate: loginResponse.birthDate,
                gender: loginResponse.gender,
                additionalInfo: loginResponse.additionalInfo,
                isWalkCammer: loginResponse.isWalkCammer,
                profileImage: loginResponse.profileImage,
                configurations: .init(
                    streetcamConfiguration: loginResponse.configurations.streetcamConfiguration.onboardingReaded,
                    scan3dConfiguration: loginResponse.configurations.scan3dConfiguration.onboardingReaded,
                    videocallConfiguration: loginResponse.configurations.videocallConfiguration.onboardingReaded,
                    arHandsConfiguration: loginResponse.configurations.arHandsConfiguration.onboardingReaded,
                    digitalTwinsConfiguration: loginResponse.configurations.digitalTwinsConfiguration.onboardingReaded,
                    droneConfiguration: loginResponse.configurations.droneConfiguration.onboardingReaded,
                    droneIOTConfiguration: loginResponse.configurations.droneIOTConfiguration.onboardingReaded,
                    print3dConfiguration: loginResponse.configurations.print3dConfiguration.onboardingReaded
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
            phone: phone,
            birthDate: birthDate,
            gender: gender,
            additionalInfo: additionalInfo ?? "",
            isWalkCamer: isWalkCammer,
            configurations: .init(
                streetcamConfiguration: configurations.streetcamConfiguration,
                scan3dConfiguration: configurations.scan3dConfiguration,
                videocallConfiguration: configurations.videocallConfiguration,
                arHandsConfiguration: configurations.arHandsConfiguration,
                digitalTwinsConfiguration: configurations.digitalTwinsConfiguration,
                droneConfiguration: configurations.droneConfiguration,
                droneIOTConfiguration: configurations.droneIOTConfiguration,
                print3dConfiguration: configurations.print3dConfiguration
            ),
            plan: .init()
        )
    }
}
