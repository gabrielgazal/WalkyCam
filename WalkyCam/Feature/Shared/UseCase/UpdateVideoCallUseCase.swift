//
//  UpdateVideoCallUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/07/24.
//

import Foundation
import Networking
import Combine

typealias UpdateVideoCallUseCase = GenericUseCase<UpdateVideoCallInput, String>

extension UpdateVideoCallUseCase {

    static func updateVideoCall(
        repository: VideoCallRepositoryProtocol
    ) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.update(
                        callId: input.callId,
                        date: input.date,
                        startTime: input.startTime,
                        endTime: input.endTime,
                        pixelationEnabled: input.pixelationEnabled) { result in
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
