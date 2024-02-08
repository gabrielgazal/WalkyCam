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

    func getStreetCamConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getStreetCamConfiguration(userId: userId),
                         completion: completion)
    }

    func getScan3DConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getScan3DConfiguration(userId: userId),
                         completion: completion)
    }

    func getVideoCallConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getVideoCallConfiguration(userId: userId),
                         completion: completion)
    }

    func getARHandsConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getARHandsConfiguration(userId: userId),
                         completion: completion)
    }

    func getDigitalTwinsCamConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getDigitalTwinsCamConfiguration(userId: userId),
                         completion: completion)
    }

    func getDroneConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getDroneConfiguration(userId: userId),
                         completion: completion)
    }

    func updateStreetCamConfiguration(userId: String, completion: @escaping Completion) {
        provider.request(.getStreetCamConfiguration(userId: userId),
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
