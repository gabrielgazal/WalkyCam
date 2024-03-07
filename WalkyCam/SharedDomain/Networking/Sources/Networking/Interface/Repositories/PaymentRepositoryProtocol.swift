//
//  File.swift
//  
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine

public protocol PaymentRepositoryProtocol {
    typealias CreateResult = Result<String, RepositoryError>

    func createUserPayment(userid: String,
                           completion: @escaping (CreateResult) -> Void)
}
