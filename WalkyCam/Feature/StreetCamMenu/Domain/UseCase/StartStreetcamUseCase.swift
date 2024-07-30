//
//  StartStreetcamUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Foundation
import Networking
import Combine

typealias StartStreetcamUseCase = GenericUseCase<String, VideoCallOutput>

extension StartStreetcamUseCase {

    static func create(repository: StreetcamRepositoryProtocol) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.startCreate(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(convertToObject(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
    
    static func schedule(repository: StreetcamRepositoryProtocol) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.startSchedule(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(convertToObject(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
    
    private static func convertToObject(_ response: VideoCallResponse) -> VideoCallOutput {
        return .init(
            id: response.id,
            type: response.type,
            baseFunction: response.baseFunction,
            date: response.date ?? "",
            startTime: response.startTime,
            endTime: response.endTime,
            timeZone: response.timeZone,
            pixelationEnabled: response.pixelationEnabled,
            status: response.status ?? ""
        )
    }

}
