//
//  WalkcamerConvertUserRequest.swift
//  Networking
//
//  Created by Gabriel Gazal on 14/10/25.
//

import Foundation

public struct WalkcamerConvertUserRequest: Codable {
    let id_user: String
    let earning_type: String
    let preferred_location_latitude: Double
    let preferred_location_longitude: Double
    let days: [DayRequest]
    let dive_info: DiveInfo?
    let drive_info: DriveInfo?
    let rovs_info: [DeviceInfo]
    let smartphones_info: [DeviceInfo]
    let cellphone_number: String
    
    public struct DayRequest: Codable {
        let day: String
        let primary_start_time: String
        let primary_end_time: String
        let secondary_start_time: String
        let secondary_end_time: String
        
        public init(
            day: String,
            primary_start_time: String,
            primary_end_time: String,
            secondary_start_time: String,
            secondary_end_time: String
        ) {
            self.day = day
            self.primary_start_time = primary_start_time
            self.primary_end_time = primary_end_time
            self.secondary_start_time = secondary_start_time
            self.secondary_end_time = secondary_end_time
        }
    }
    
    public struct DiveInfo: Codable {
        let max_meters_depth: Int
        
        public init(max_meters_depth: Int) {
            self.max_meters_depth = max_meters_depth
        }
    }
    
    public struct DriveInfo: Codable {
        let vehicle_type: String
        
        public init(vehicle_type: String) {
            self.vehicle_type = vehicle_type
        }
    }
    
    public struct DeviceInfo: Codable {
        let brand: String
        let model: String
        let serial_number: String
        
        public init(
            brand: String,
            model: String,
            serial_number: String
        ) {
            self.brand = brand
            self.model = model
            self.serial_number = serial_number
        }
    }
    
    public init(
        id_user: String,
        earning_type: String,
        preferred_location_latitude: Double,
        preferred_location_longitude: Double,
        days: [DayRequest],
        dive_info: DiveInfo?,
        drive_info: DriveInfo?,
        rovs_info: [DeviceInfo],
        smartphones_info: [DeviceInfo],
        cellphone_number: String
    ) {
        self.id_user = id_user
        self.earning_type = earning_type
        self.preferred_location_latitude = preferred_location_latitude
        self.preferred_location_longitude = preferred_location_longitude
        self.days = days
        self.dive_info = dive_info
        self.drive_info = drive_info
        self.rovs_info = rovs_info
        self.smartphones_info = smartphones_info
        self.cellphone_number = cellphone_number
    }
}
