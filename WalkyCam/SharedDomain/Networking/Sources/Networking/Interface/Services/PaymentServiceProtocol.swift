//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation

protocol PaymentServiceProtocol {
    func createUserPayment(planName: String, planType: String, completion: @escaping Completion)
}
