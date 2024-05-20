//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Foundation

public protocol VideoCallRepositoryProtocol {
    
    typealias CreateCallResult = Result<Void, RepositoryError>
    typealias StartScheduleResult = Result<Void, RepositoryError>
    typealias UpdateCallResult = Result<Void, RepositoryError>
    typealias CancelCallResult = Result<Void, RepositoryError>
    typealias ScheduleCallResult = Result<Void, RepositoryError>

    func create(userId: String,
                completion: @escaping (CreateCallResult) -> Void)
    func startSchedule(userId: String,
                       completion: @escaping (StartScheduleResult) -> Void)
    func update(callId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                timeZone: String,
                completion: @escaping (UpdateCallResult) -> Void)
    func cancel(callId: String,
                completion: @escaping (CancelCallResult) -> Void)
    func schedule(callId: String,
                  completion: @escaping (ScheduleCallResult) -> Void)
}
