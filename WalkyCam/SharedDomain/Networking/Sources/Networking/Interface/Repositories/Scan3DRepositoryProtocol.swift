//
//  File.swift
//
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Foundation

public protocol Scan3DRepositoryProtocol {
    
    typealias StartCreateScan3DResult = Result<VideoCallResponse, RepositoryError>
    typealias CreateScan3DResult = Result<VideoCallResponse, RepositoryError>
    typealias StartScheduleResult = Result<VideoCallResponse, RepositoryError>
    typealias UpdateScan3DResult = Result<VideoCallResponse, RepositoryError>
    typealias CancelScan3DResult = Result<Void, RepositoryError>
    typealias ScheduleScan3DResult = Result<VideoCallResponse, RepositoryError>
    
    func startCreate(userId: String,
                     completion: @escaping (StartCreateScan3DResult) -> Void)
    func create(scan3dId: String,
                completion: @escaping (CreateScan3DResult) -> Void)
    func startSchedule(userId: String,
                       completion: @escaping (StartScheduleResult) -> Void)
    func schedule(scan3dId: String,
                  completion: @escaping (ScheduleScan3DResult) -> Void)
    func update(scan3dId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                completion: @escaping (UpdateScan3DResult) -> Void)
    func cancel(scan3dId: String,
                completion: @escaping (CancelScan3DResult) -> Void)
}
