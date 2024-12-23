//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya

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
        userId: String,
        phoneNumber: String,
        earningType: String,
        preferredLatitude: String,
        preferredLongitude: String,
        rovsInfo: [String],
        smartphonesInfo: [String],
        diveInfo: [String],
        driveInfo: [String],
        days: [String],
        completion: @escaping (ConvertUserResult) -> Void
    ) {
        service.convertUser(
            userId: userId,
            phoneNumber: phoneNumber,
            earningType: earningType,
            preferredLatitude: preferredLatitude,
            preferredLongitude: preferredLongitude,
            rovsInfo: rovsInfo,
            smartphonesInfo: smartphonesInfo,
            diveInfo: diveInfo,
            driveInfo: driveInfo,
            days: days) { result in
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
    
    func getNearWalkcammers(completion: @escaping (GetNearWalkCamersResult) -> Void) {
        service.getNearWalkcammers { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "walkcamers")))
        }
    }
    
    func searchWalkcammer(input: String, completion: @escaping (SearchWalkCamersResult) -> Void) {
        service.searchWalkcammer(input: input) { result in
            completion(result.mapToRepositoryResult(with: DefaultRequestHandler(at: "walkcamers")))
        }
    }
}
