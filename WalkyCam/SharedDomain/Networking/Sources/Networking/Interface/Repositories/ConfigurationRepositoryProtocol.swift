//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Combine

public protocol ConfigurationRepositoryProtocol {
    typealias GetConfigurationResult = Result<ConfigurationResponse, RepositoryError>
    typealias UpdateConfigurationResult = Result<Void, RepositoryError>

    func getStreetCamConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)
    func getScan3DConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)
    func getVideoCallConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)
    func getARHandsConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)
    func getDigitalTwinsCamConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)
    func getDroneConfiguration(userId: String, completion: @escaping (GetConfigurationResult) -> Void)

    func updateStreetCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateScan3DConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateVideoCallConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateARHandsConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDroneConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
}
