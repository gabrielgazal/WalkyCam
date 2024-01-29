//
//  UserSession.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 29/01/24.
//

struct UserSession {

    private let userPersistenceKey = "UserSession"
    private let keychainPersistence: KeychainPersistenceProtocol

    init(keychainPersistence: KeychainPersistenceProtocol = KeychainPersistence()) {
        self.keychainPersistence = keychainPersistence
    }
}

extension UserSession: UserSessionProtocol {
    func save(user: UserSessionData) throws {
        try keychainPersistence.set(user, forKey: userPersistenceKey)
    }

    func user() throws -> UserSessionData {
        try keychainPersistence.codable(forKey: userPersistenceKey)
    }

    func clear() throws {
        try keychainPersistence.removeObject(forKey: userPersistenceKey)
    }

    func isLogged() -> Bool {
        if let user = try? user() {
            return true
        }
        return false
    }
}
