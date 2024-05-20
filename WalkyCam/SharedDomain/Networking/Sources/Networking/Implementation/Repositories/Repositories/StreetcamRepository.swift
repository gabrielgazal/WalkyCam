//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

final class StreetcamRepository: StreetcamRepositoryProtocol {
    // MARK: - Dependencies

    private let service: StreetcamServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: StreetcamServiceProtocol = StreetcamService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "streetcam")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func startCreate(userId: String, 
                     completion: @escaping (StartCreateStreetcamResult) -> Void) {
        service.startCreate(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func create(
        streetcamId: String,
        completion: @escaping (CreateStreetcamResult) -> Void
    ) {
        service.create(streetcamId: streetcamId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func startSchedule(
        userId: String,
        completion: @escaping (StartScheduleResult) -> Void
    ) {
        service.startSchedule(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func update(
        streetcamId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        timeZone: String,
        completion: @escaping (UpdateStreetcamResult) -> Void
    ) {
        service.update(
            streetcamId: streetcamId,
            date: date,
            startTime: startTime,
            endTime: endTime,
            pixelationEnabled: pixelationEnabled,
            timeZone: timeZone) { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
    }
    
    func cancel(
        streetcamId: String,
        completion: @escaping (CancelStreetcamResult) -> Void
    ) {
        service.cancel(streetcamId: streetcamId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func schedule(
        streetcamId: String,
        completion: @escaping (ScheduleStreetcamResult) -> Void
    ) {
        service.schedule(streetcamId: streetcamId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
