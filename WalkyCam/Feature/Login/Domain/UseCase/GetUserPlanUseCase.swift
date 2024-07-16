//
//  GetUserPlanUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 15/07/24.
//

import Foundation
import Networking
import Combine

typealias GetUserPlanUseCase = GenericUseCase<LoginInput, UserPlanOutput>

extension GetUserPlanUseCase {
    
    static func live(
        repository: AuthRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.getUserPlan(userName: credentials.userName,
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
        loginResponse: PlanResponse,
        in session: UserSessionProtocol
    ) throws -> UserPlanOutput {
        do {
            let planOutput = UserPlanOutput(
                id: loginResponse.id,
                name: loginResponse.name
            )

            var user = try UserSession().user()
            user.plan.id = loginResponse.id
            user.plan.name = loginResponse.name
            
            try session.save(user: user)

            return planOutput
        } catch {
            throw error
        }
    }
}
