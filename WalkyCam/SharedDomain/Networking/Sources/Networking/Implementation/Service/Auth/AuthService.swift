//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class AuthService: AuthServiceProtocol {
    // MARK: - Dependencies
    
    private let provider: MoyaProvider<AuthRouter>
    // MARK: - Initialization
    
    public convenience init() {
        self.init(provider: .default)
    }
    
    init(provider: MoyaProvider<AuthRouter>) {
        self.provider = provider
    }
    
    // MARK: - Public API

    func login(userName: String,
               password: String,
               completion: @escaping Completion) {
        provider.request(.login(userName: userName, password: password),
                         completion: completion)
    }

    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping Completion) {
        provider.request(.register(name: name,
                                   lastName: lastName,
                                   userName: userName,
                                   email: email,
                                   password: password),
                         completion: completion)
    }
}
