//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class ConfigurationService: ConfigurationServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<ConfigurationRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<ConfigurationRouter>) {
        self.provider = provider
    }

    // MARK: - Public API

    func updateStreetCamConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateStreetCamConfiguration(userId: userId),
                         completion: completion)
    }

    func updateScan3DConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateScan3DConfiguration(userId: userId),
                         completion: completion)
    }

    func updateVideoCallConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateVideoCallConfiguration(userId: userId),
                         completion: completion)
    }

    func updateARHandsConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateARHandsConfiguration(userId: userId),
                         completion: completion)
    }

    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateDigitalTwinsCamConfiguration(userId: userId),
                         completion: completion)
    }

    func updateDroneConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.updateDroneConfiguration(userId: userId),
                         completion: completion)
    }
}
