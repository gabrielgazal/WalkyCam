//
//  UserSessionProtocol.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

protocol UserSessionProtocol {
    func save(user: UserSessionData) throws
    func user() throws -> UserSessionData
    func clear() throws
    func isLogged() -> Bool
}
