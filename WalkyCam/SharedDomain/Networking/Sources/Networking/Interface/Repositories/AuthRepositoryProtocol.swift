//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine

public protocol AuthRepositoryProtocol {
    typealias LoginResult = Result<Bool, RepositoryError>
    typealias RegisterResult = Result<Bool, RepositoryError>

    func login(userName: String,
               password: String,
               completion: @escaping (LoginResult) -> Void)
    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping (RegisterResult) -> Void)
}