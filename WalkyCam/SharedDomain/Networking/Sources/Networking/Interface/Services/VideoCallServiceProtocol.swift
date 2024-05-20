//
//  VideoCallServiceProtocol.swift
//
//
//  Created by Gabriel Gazal on 20/05/24.
//

import Combine
import Moya
import Foundation

protocol VideoCallServiceProtocol {
    
    func create(userId: String,
                completion: @escaping Completion)
    func startSchedule(userId: String,
                       completion: @escaping Completion)
    func update(callId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                timeZone: String,
                completion: @escaping Completion)
    func cancel(callId: String,
                completion: @escaping Completion)
    func schedule(callId: String,
                  completion: @escaping Completion)
}
