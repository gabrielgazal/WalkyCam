//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

final class Scan3DRepository: Scan3DRepositoryProtocol {
    // MARK: - Dependencies

    private let service: Scan3DServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: Scan3DServiceProtocol = Scan3DService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "scan3d")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func startCreate(userId: String, 
                     completion: @escaping (StartCreateScan3DResult) -> Void) {
        service.startCreate(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func create(
        scan3dId: String,
        completion: @escaping (CreateScan3DResult) -> Void
    ) {
        service.create(scan3dId: scan3dId) { result in
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
        scan3dId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        completion: @escaping (UpdateScan3DResult) -> Void
    ) {
        service.update(
            scan3dId: scan3dId,
            date: date,
            startTime: startTime,
            endTime: endTime,
            pixelationEnabled: pixelationEnabled) { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
    }
    
    func cancel(
        scan3dId: String,
        completion: @escaping (CancelScan3DResult) -> Void
    ) {
        service.cancel(scan3dId: scan3dId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func schedule(
        scan3dId: String,
        completion: @escaping (ScheduleScan3DResult) -> Void
    ) {
        service.schedule(scan3dId: scan3dId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
