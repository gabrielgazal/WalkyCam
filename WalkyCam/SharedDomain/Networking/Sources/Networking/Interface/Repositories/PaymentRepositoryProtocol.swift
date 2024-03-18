//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine

public protocol PaymentRepositoryProtocol {
    typealias CreateResult = Result<ConfigurationIntentResponse, RepositoryError>

    func createUserPayment(planName: String,
                           planType: String,
                           completion: @escaping (CreateResult) -> Void)
}
