//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine

public protocol AuthRepositoryProtocol {
    func login(userName: String, password: String) -> AnyPublisher<Bool, RepositoryError>
    func register(name: String, lastName: String, userName: String, email: String, password: String) -> AnyPublisher<Bool, RepositoryError>
}
