//
//  WalkcamerRepositoryProtocol.swift
//
//
//  Created by Gabriel Gazal on 25/04/24.
//

import Foundation

public protocol WalkcamerRepositoryProtocol {
    typealias ConvertUserResult = Result<Void, RepositoryError>
    typealias UpdateUserAvailabilityResult = Result<Void, RepositoryError>
    
    func convertUser(userId: String,
                     phoneNumber: String,
                     earningType: String,
                     preferredLatitude: String,
                     preferredLongitude: String,
                     rovsInfo: [String],
                     smartphonesInfo: [String],
                     diveInfo: [String],
                     driveInfo: [String],
                     days: [String],
                     completion: @escaping (ConvertUserResult) -> Void)
    
    func updateAvailability(userId: String,
                            completion: @escaping (UpdateUserAvailabilityResult) -> Void)
}
