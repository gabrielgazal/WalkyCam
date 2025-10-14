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
    
    func convertUser(data: WalkcamerConvertUserRequest,
                     completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.convertUser(data), completion: completion)

    }
    
    func updateAvailability(userId: String, 
                            completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(.updateAvailability(userId: userId), 
                         completion: completion)
    }
    
    func getNearWalkcammers(lat: CGFloat, lon: CGFloat, completion: @escaping Completion) {
        provider.request(
            .getNearWalkcammers(lat: lat, lon: lon),
            completion: completion
        )
    }
    
    func searchWalkcammer(input: String, completion: @escaping Completion) {
        provider.request(
            .searchWalkcammer(input: input),
            completion: completion
        )
    }
}
