//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation

final class WalkcamerRepository: WalkcamerRepositoryProtocol {
    // MARK: - Dependencies

    private let service: WalkcamerServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: WalkcamerServiceProtocol = WalkcamerService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler()
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func convertUser(
        data: WalkcamerConvertUserRequest,
        completion: @escaping (ConvertUserResult) -> Void
    ) {
        service.convertUser(data: data) { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
    }
    
    func updateAvailability(
        userId: String,
        completion: @escaping (UpdateUserAvailabilityResult) -> Void
    ) {
        service.updateAvailability(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
    
    func getNearWalkcammers(lat: CGFloat, lon: CGFloat, completion: @escaping (GetNearWalkCamersResult) -> Void) {
        service.getNearWalkcammers(lat: lat, lon: lon) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "walkcamers")))
        }
    }
    
    func searchWalkcammer(input: String, completion: @escaping (SearchWalkCamersResult) -> Void) {
        service.searchWalkcammer(input: input) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "walkcamers")))
        }
    }
}
