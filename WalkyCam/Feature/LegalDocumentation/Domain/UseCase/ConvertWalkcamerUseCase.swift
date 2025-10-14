//
//  ConvertWalkcamerUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/10/25.
//

import Foundation
import Networking
import Combine

typealias ConvertWalkcamerUseCase = GenericUseCase<CamerRegistrationData, Void>

extension ConvertWalkcamerUseCase {
    static func convertCammer(repository: WalkcamerRepositoryProtocol) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.convertUser(
                        data: mapToRepositoryObject(input)
                    ) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(()))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
    
    static func mapToRepositoryObject(_ registrationData: CamerRegistrationData) -> WalkcamerConvertUserRequest {
        let request = WalkcamerConvertUserRequest(
            id_user: registrationData.id,
            earning_type: registrationData.earningType,
            preferred_location_latitude: registrationData.preferredLocation.latitude,
            preferred_location_longitude: registrationData.preferredLocation.longitude,
            days: registrationData.days.map {
                WalkcamerConvertUserRequest.DayRequest(
                    day: $0.name,
                    primary_start_time: $0.primaryStartTime,
                    primary_end_time: $0.primaryEndTime,
                    secondary_start_time: $0.secondaryStartTime,
                    secondary_end_time: $0.secondaryEndTime
                )
            },
            dive_info: .init(max_meters_depth: 30),
            drive_info: .init(vehicle_type: "car"),
            rovs_info: registrationData.devicesInfo
                .filter { $0.type == .rov }
                .map {
                    WalkcamerConvertUserRequest.DeviceInfo(
                        brand: $0.brand,
                        model: $0.model,
                        serial_number: $0.serialNumber
                    )
                },
            smartphones_info: registrationData.devicesInfo
                .filter { $0.type == .smartphone }
                .map {
                    WalkcamerConvertUserRequest.DeviceInfo(
                        brand: $0.brand,
                        model: $0.model,
                        serial_number: $0.serialNumber
                    )
                },
            cellphone_number: registrationData.phoneNumber
        )
        
        return request
    }
}

