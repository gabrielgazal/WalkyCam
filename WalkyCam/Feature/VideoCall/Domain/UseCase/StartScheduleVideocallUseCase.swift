//
//  StartScheduleVideocallUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/07/24.
//

import Foundation
import Networking
import Combine

typealias StartScheduleVideocallUseCase = GenericUseCase<Void, String>

extension StartScheduleVideocallUseCase {

    static func startScheduleVideoCall(
        repository: VideoCallRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { _ in
            Deferred {
                Future { promise in
                    let userId = try? userSession.user().id
                    repository.startSchedule(userId: userId ?? "") { result in
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
