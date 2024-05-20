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

final class StreetcamService: StreetcamServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<StreetcamRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<StreetcamRouter>) {
        self.provider = provider
    }

    // MARK: - Public API
    
    func startCreate(userId: String, completion: @escaping Completion) {
        provider.request(.startCreate(userId: userId),
                         completion: completion)
    }
    
    func create(
        streetcamId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.create(streetcamId: streetcamId),
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
        streetcamId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        timeZone: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(
            .update(
                streetcamId: streetcamId,
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
        streetcamId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.cancel(streetcamId: streetcamId),
                         completion: completion)
    }
    
    func schedule(
        streetcamId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.schedule(streetcamId: streetcamId),
                         completion: completion)
    }
}
