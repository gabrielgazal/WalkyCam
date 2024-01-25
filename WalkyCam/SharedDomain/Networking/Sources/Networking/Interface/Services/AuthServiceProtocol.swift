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
    typealias LoginResult = ()
    func login(userName: String,
               password: String,
               completion: @escaping Completion)
    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping Completion)
}
