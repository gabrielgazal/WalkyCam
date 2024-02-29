//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Combine

public protocol ConfigurationRepositoryProtocol {
    typealias GetStreetCamConfigurationResult = Result<StreetCamConfigurationResponse, RepositoryError>
    typealias GetScan3DConfigurationResult = Result<Scan3DConfigurationResponse, RepositoryError>
    typealias GetVideoCallConfigurationResult = Result<VideocallConfigurationResponse, RepositoryError>
    typealias GetARHandsConfigurationResult = Result<ARHandsConfigurationResponse, RepositoryError>
    typealias GetDigitalTwinsConfigurationResult = Result<DigitalTwinsConfigurationResponse, RepositoryError>
    typealias GetDroneConfigurationResult = Result<DroneConfigurationResponse, RepositoryError>

    typealias UpdateConfigurationResult = Result<Void, RepositoryError>

    func getStreetCamConfiguration(userId: String, completion: @escaping (GetStreetCamConfigurationResult) -> Void)
    func getScan3DConfiguration(userId: String, completion: @escaping (GetScan3DConfigurationResult) -> Void)
    func getVideoCallConfiguration(userId: String, completion: @escaping (GetVideoCallConfigurationResult) -> Void)
    func getARHandsConfiguration(userId: String, completion: @escaping (GetARHandsConfigurationResult) -> Void)
    func getDigitalTwinsCamConfiguration(userId: String, completion: @escaping (GetDigitalTwinsConfigurationResult) -> Void)
    func getDroneConfiguration(userId: String, completion: @escaping (GetDroneConfigurationResult) -> Void)

    func updateStreetCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateScan3DConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateVideoCallConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateARHandsConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
    func updateDroneConfiguration(userId: String, completion: @escaping (UpdateConfigurationResult) -> Void)
}
