//
//  WalkcamerRegistrationManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 20/08/24.
//

import Foundation

protocol WalkcamerRegistrationManagerProtocol {
    func updateUserInfo(id: String, name: String, lastName: String, phoneNumber: String, email: String)
    func updateContractType(_ type: CamerContractType)
}

class WalkcamerRegistrationManager: WalkcamerRegistrationManagerProtocol {
    static let shared = WalkcamerRegistrationManager()
    
    private var cammerData: CamerRegistrationData = .init()
    
    public init() {}
    
    
    // MARK: - Public API
    
    func updateUserInfo(id: String, name: String, lastName: String, phoneNumber: String, email: String) {
        cammerData.id = id
        cammerData.name = name
        cammerData.lastName = lastName
        cammerData.phoneNumber = phoneNumber
        cammerData.email = email
    }
    
    func updateContractType(_ type: CamerContractType) {
        cammerData.earningType = type.rawValue
    }
}

enum CamerContractType: String {
    case freelance
    case employee
    case b2b
}
