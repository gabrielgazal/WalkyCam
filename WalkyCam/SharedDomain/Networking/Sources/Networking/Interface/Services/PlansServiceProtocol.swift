//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/03/24.
//

import Combine
import Moya
import Foundation

protocol PlansServiceProtocol {
    func getAllPlans(completion: @escaping Completion)
    func getPlanById(id: String, completion: @escaping Completion)
}
