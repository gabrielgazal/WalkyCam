//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class VideoCallService: VideoCallServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<VideoCallRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<VideoCallRouter>) {
        self.provider = provider
    }

    // MARK: - Public API
    
    func create(
        userId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.create(userId: userId),
                         completion: completion)
    }
    
    func startSchedule(
        userId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.startSchedule(userId: userId),
                         completion: completion)
    }
    
    func update(
        callId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        timeZone: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(
            .update(
                callId: callId,
                date: date,
                startTime: startTime,
                endTime: endTime,
                pixelationEnabled: pixelationEnabled,
                timeZone: timeZone
            ),
            completion: completion
        )
    }
    
    func cancel(
        callId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.cancel(callId: callId),
                         completion: completion)
    }
    
    func schedule(
        callId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.schedule(callId: callId),
                         completion: completion)
    }
}
