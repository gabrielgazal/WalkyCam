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

final class WalkcamerService: WalkcamerServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<WalkcamerRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<WalkcamerRouter>) {
        self.provider = provider
    }

    // MARK: - Public API
    
    func convertUser(userId: String,
                     phoneNumber: String,
                     earningType: String,
                     preferredLatitude: String,
                     preferredLongitude: String,
                     rovsInfo: [String],
                     smartphonesInfo: [String],
                     diveInfo: [String],
                     driveInfo: [String],
                     days: [String],
                     completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(
            .convertUser(
                userId: userId,
                phoneNumber: phoneNumber,
                earningType: earningType,
                preferredLatitude: preferredLatitude,
                preferredLongitude: preferredLongitude,
                rovsInfo: rovsInfo,
                smartphonesInfo: smartphonesInfo,
                diveInfo: diveInfo,
                driveInfo: driveInfo,
                days: days
            ),
            completion: completion
        )
    }
    
    func updateAvailability(userId: String, 
                            completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.updateAvailability(userId: userId), 
                         completion: completion)
    }
}
