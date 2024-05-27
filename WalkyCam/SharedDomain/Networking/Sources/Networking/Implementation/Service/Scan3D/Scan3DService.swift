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

final class Scan3DService: Scan3DServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<Scan3DRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<Scan3DRouter>) {
        self.provider = provider
    }

    // MARK: - Public API
    
    func startCreate(userId: String, completion: @escaping Completion) {
        provider.request(.startCreate(userId: userId),
                         completion: completion)
    }
    
    func create(
        scan3dId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.create(scan3dId: scan3dId),
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
        scan3dId: String,
        date: String,
        startTime: String,
        endTime: String,
        pixelationEnabled: Bool,
        completion: @escaping Moya.Completion
    ) {
        provider.request(
            .update(
                scan3dId: scan3dId,
                date: date,
                startTime: startTime,
                endTime: endTime,
                pixelationEnabled: pixelationEnabled
            ),
            completion: completion
        )
    }
    
    func cancel(
        scan3dId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.cancel(scan3dId: scan3dId),
                         completion: completion)
    }
    
    func schedule(
        scan3dId: String,
        completion: @escaping Moya.Completion
    ) {
        provider.request(.schedule(scan3dId: scan3dId),
                         completion: completion)
    }
}
