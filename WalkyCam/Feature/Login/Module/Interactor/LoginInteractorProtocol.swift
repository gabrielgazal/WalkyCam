//
//  LoginInteractorProtocol.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/01/24.
//

protocol LoginInteractorProtocol {
    func login(with input: LoginInput) async throws -> LoginOutput
    func resetPassword(email: String) async throws
}
