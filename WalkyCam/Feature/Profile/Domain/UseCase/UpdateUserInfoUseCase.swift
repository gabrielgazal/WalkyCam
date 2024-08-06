//
//  UpdateUserInfoUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 06/08/24.
//

import Foundation
import Networking
import Combine

typealias UpdateUserInfoUseCase = GenericUseCase<UserData, UserData>

extension UpdateUserInfoUseCase {
    static func updateInfo(repository: AuthRepositoryProtocol) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.updateInfo(
                        userId: input.id,
                        name: input.name,
                        lastName: input.lastName,
                        gender: input.gender,
                        cellphone: input.phoneNumber,
                        address: input.address,
                        additionalInfo: input.additionalInfo,
                        birthdate: input.birthDate) { result in
                            switch result {
                            case let .failure(error):
                                promise(.failure(error))
                            case let .success(response):
                                do {
                                    let output = try configure(
                                        response: response,
                                        in: UserSession()
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
        response: UserResponse,
        in session: UserSessionProtocol
    ) throws -> UserData {
        do {
            let output = UserSessionData(
                id: response.id,
                userName: response.userName,
                name: response.name,
                lastName: response.lastName,
                email: response.email,
                address: response.address,
                phone: response.phone,
                birthDate: response.birthDate,
                gender: response.gender,
                additionalInfo: response.additionalInfo,
                isWalkCamer: response.isWalkCammer,
                configurations: .init(
                    streetcamConfiguration: response.configurations.streetcamConfiguration.onboardingReaded,
                    scan3dConfiguration: response.configurations.scan3dConfiguration.onboardingReaded,
                    videocallConfiguration: response.configurations.videocallConfiguration.onboardingReaded,
                    arHandsConfiguration: response.configurations.arHandsConfiguration.onboardingReaded,
                    digitalTwinsConfiguration: response.configurations.digitalTwinsConfiguration.onboardingReaded,
                    droneConfiguration: response.configurations.droneConfiguration.onboardingReaded,
                    droneIOTConfiguration: response.configurations.droneIOTConfiguration.onboardingReaded,
                    print3dConfiguration: response.configurations.print3dConfiguration.onboardingReaded
                ),
                plan: .init()
            )

            try session.save(user: output)

            return output.asUserData()
        } catch {
            throw error
        }
    }
}

extension UserSessionData {
    func asUserData() -> UserData {
        return .init(
            id: id,
            profileImage: "",
            name: name,
            lastName: lastName,
            phoneNumber: phone,
            birthDate: birthDate,
            gender: gender,
            address: address,
            additionalInfo: additionalInfo,
            email: email,
            userName: userName,
            isWalkCamer: isWalkCamer,
            planName: plan.name
        )
    }
}
