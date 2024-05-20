//
//  PasswordConfigurationError.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 16/05/24.
//

import Foundation

public enum PasswordConfigurationError: CaseIterable {
    case small
    case nameEmail
    case missingSymbolNumber
    case spaces
}

public extension PasswordConfigurationError {
    func asRule() -> String {
        switch self {
        case .small:
            "Deve contener al menos 8 caracteres"
        case .nameEmail:
            "No debe contener tu nombre o email"
        case .missingSymbolNumber:
            "Utilizar al menos un símbolo o número"
        case .spaces:
            "No debe contener espacios"
        }
    }
}
