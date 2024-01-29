//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Combine
import Moya

final class AuthRepository: AuthRepositoryProtocol {
    // MARK: - Dependencies

    private let service: AuthServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: AuthServiceProtocol = AuthService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler(at: "user")
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API

    func login(userName: String, password: String, completion: @escaping (LoginResult) -> Void) {
        service.login(userName: userName, password: password) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }

    func register(name: String,
                  lastName: String,
                  userName: String,
                  email: String,
                  password: String,
                  completion: @escaping (RegisterResult) -> Void) {
        service.register(name: name,
                         lastName: lastName,
                         userName: userName,
                         email: email,
                         password: password) { result in
            completion(result.mapToRepositoryResult(with: self.requestHandler))
        }
    }
}
