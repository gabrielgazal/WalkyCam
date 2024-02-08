//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya

final class ConfigurationRepository: ConfigurationRepositoryProtocol {
    // MARK: - Dependencies

    private let service: ConfigurationServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: ConfigurationServiceProtocol = ConfigurationService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "user")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func getStreetCamConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getStreetCamConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getScan3DConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getScan3DConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getVideoCallConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getVideoCallConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getARHandsConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getARHandsConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getDigitalTwinsCamConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getDigitalTwinsCamConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func getDroneConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void) {
        service.getDroneConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateStreetCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateStreetCamConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateScan3DConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateScan3DConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateVideoCallConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateVideoCallConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateARHandsConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateARHandsConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateDigitalTwinsCamConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func updateDroneConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void) {
        service.updateDroneConfiguration(userId: userId) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
