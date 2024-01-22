//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya
import Foundation

protocol AuthServiceProtocol {
    func login(userName: String, password: String) -> AnyPublisher<Response, MoyaError>
    func register(name: String, lastName: String, userName: String, email: String, password: String) -> AnyPublisher<Response, MoyaError>
}
