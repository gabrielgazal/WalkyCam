//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/03/24.
//

import Combine
import Moya
import Foundation

protocol WalkcamerServiceProtocol {
    
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
                     completion: @escaping Completion)
    
    func updateAvailability(userId: String,
                            completion: @escaping Completion)
    func getNearWalkcammers(lat: CGFloat, lon: CGFloat, completion: @escaping Completion)
    func searchWalkcammer(input: String, completion: @escaping Completion)
}
