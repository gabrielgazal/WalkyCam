//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 08/02/24.
//

import Combine
import Moya
import Foundation

protocol ConfigurationServiceProtocol {
    func getStreetCamConfiguration(userId: String, completion: @escaping Completion)
    func getScan3DConfiguration(userId: String, completion: @escaping Completion)
    func getVideoCallConfiguration(userId: String, completion: @escaping Completion)
    func getARHandsConfiguration(userId: String, completion: @escaping Completion)
    func getDigitalTwinsCamConfiguration(userId: String, completion: @escaping Completion)
    func getDroneConfiguration(userId: String, completion: @escaping Completion)

    func updateStreetCamConfiguration(userId: String, completion: @escaping Completion)
    func updateScan3DConfiguration(userId: String, completion: @escaping Completion)
    func updateVideoCallConfiguration(userId: String, completion: @escaping Completion)
    func updateARHandsConfiguration(userId: String, completion: @escaping Completion)
    func updateDigitalTwinsCamConfiguration(userId: String, completion: @escaping Completion)
    func updateDroneConfiguration(userId: String, completion: @escaping Completion)
}