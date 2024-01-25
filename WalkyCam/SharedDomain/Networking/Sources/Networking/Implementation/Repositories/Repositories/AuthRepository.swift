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
    // MARK: - Initialization

    init(
        service: AuthServiceProtocol = AuthService()
    ) {
        self.service = service
    }

    // MARK: - Public API

    func login(userName: String, password: String) -> AnyPublisher<Bool, RepositoryError> {
        service
            .login(userName: userName, password: password)
            .handle(by: DefaultRequestHandler(at: "success"))
            .eraseToAnyPublisher()
    }
    
    func register(name: String, lastName: String, userName: String, email: String, password: String) -> AnyPublisher<Bool, RepositoryError> {
        service
            .register(name: name, lastName: lastName, userName: userName, email: email, password: password)
            .handle(by: DefaultRequestHandler(at: "success"))
            .eraseToAnyPublisher()
    }
}
