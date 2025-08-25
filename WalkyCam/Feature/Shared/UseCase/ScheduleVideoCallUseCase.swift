//
//  ScheduleVideoCallUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/07/24.
//

import Foundation
import Networking
import Combine

typealias ScheduleVideoCallUseCase = GenericUseCase<String, String>

extension ScheduleVideoCallUseCase {

    static func scheduleVideoCall(
        repository: VideoCallRepositoryProtocol,
        userSession: UserSessionProtocol = UserSession()
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    let userId = try? userSession.user().id
                    repository.schedule(callId: input) { result in
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
