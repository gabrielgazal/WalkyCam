//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Combine

public protocol ConfigurationRepositoryProtocol {

    typealias UpdateConfigurationResult = Result<Void, RepositoryError>

    func updateStreetCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateScan3DConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateVideoCallConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateARHandsConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDroneConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
}
