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
    
    func convertUser(data: WalkcamerConvertUserRequest,
                     completion: @escaping Completion)
    
    func updateAvailability(userId: String,
                            completion: @escaping Completion)
    func getNearWalkcammers(lat: CGFloat, lon: CGFloat, completion: @escaping Completion)
    func searchWalkcammer(input: String, completion: @escaping Completion)
}
