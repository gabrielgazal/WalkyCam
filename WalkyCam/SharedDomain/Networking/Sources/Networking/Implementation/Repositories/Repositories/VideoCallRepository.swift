//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

final class VideoCallRepository: VideoCallRepositoryProtocol {
    // MARK: - Dependencies

    private let service: VideoCallServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: VideoCallServiceProtocol = VideoCallService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "videocall")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func create(
        userId: String,
        completion: @escaping (CreateCallResult) -> Void
    ) {
        service.create(userId: userId) { result in
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
        callId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        timeZone: String,
        completion: @escaping (UpdateCallResult) -> Void
    ) {
        service.update(
            callId: callId,
            date: date,
            startTime: startTime,
            endTime: endTime,
            pixelationEnabled: pixelationEnabled,
            timeZone: timeZone) { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
    }
    
    func cancel(
        callId: String,
        completion: @escaping (CancelCallResult) -> Void
    ) {
        service.cancel(callId: callId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func schedule(
        callId: String,
        completion: @escaping (ScheduleCallResult) -> Void
    ) {
        service.schedule(callId: callId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
