//
//  FetchUserDataUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

import Foundation
import Networking
import Combine

typealias FetchUserDataUseCase = GenericUseCase<Void, UserSessionData>

extension FetchUserDataUseCase {
    static func live(userSession: UserSessionProtocol = UserSession()) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    do {
                        let user = try userSession.user()
                        promise(.success(user))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
