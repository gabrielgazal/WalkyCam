//
//  FetchUserHeaderDataUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

import Foundation
import Networking
import Combine

typealias FetchUserHeaderDataUseCase = GenericUseCase<Void, ProfileData>

extension FetchUserHeaderDataUseCase {
    static func live(userSession: UserSessionProtocol = UserSession()) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    do {
                        let user = try userSession.user()
                        promise(.success(parseCredentialsOutput(user)))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    private static func parseCredentialsOutput(_ data: UserSessionData) -> ProfileData {
        return ProfileData(name: data.name)
    }
}
