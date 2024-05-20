//
//  File.swift
//
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Foundation

public protocol StreetcamRepositoryProtocol {
    
    typealias StartCreateStreetcamResult = Result<Void, RepositoryError>
    typealias CreateStreetcamResult = Result<Void, RepositoryError>
    typealias StartScheduleResult = Result<Void, RepositoryError>
    typealias UpdateStreetcamResult = Result<Void, RepositoryError>
    typealias CancelStreetcamResult = Result<Void, RepositoryError>
    typealias ScheduleStreetcamResult = Result<Void, RepositoryError>
    
    func startCreate(userId: String,
                     completion: @escaping (StartCreateStreetcamResult) -> Void)
    func create(streetcamId: String,
                completion: @escaping (CreateStreetcamResult) -> Void)
    func startSchedule(userId: String,
                       completion: @escaping (StartScheduleResult) -> Void)
    func schedule(streetcamId: String,
                  completion: @escaping (ScheduleStreetcamResult) -> Void)
    func update(streetcamId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                timeZone: String,
                completion: @escaping (UpdateStreetcamResult) -> Void)
    func cancel(streetcamId: String,
                completion: @escaping (CancelStreetcamResult) -> Void)
}
