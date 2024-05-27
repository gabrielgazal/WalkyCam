//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Combine
import Moya
import Foundation

protocol Scan3DServiceProtocol {
    func startCreate(userId: String,
                     completion: @escaping Completion)
    func create(scan3dId: String,
                completion: @escaping Completion)
    func startSchedule(userId: String,
                       completion: @escaping Completion)
    func schedule(scan3dId: String,
                  completion: @escaping Completion)
    func update(scan3dId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                completion: @escaping Completion)
    func cancel(scan3dId: String,
                completion: @escaping Completion)
}
