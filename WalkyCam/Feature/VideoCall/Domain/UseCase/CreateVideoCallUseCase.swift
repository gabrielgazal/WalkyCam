//
//  CreateVideoCallUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 28/06/24.
//

import Foundation
import Networking
import Combine

typealias CreateVideoCallUseCase = GenericUseCase<Void, String>

extension CreateVideoCallUseCase {

    static func createVideoCall(
        repository: VideoCallRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    let userId = try? userSession.user().id
                    repository.create(userId: userId ?? "") { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(response.id))
                        }
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
}
