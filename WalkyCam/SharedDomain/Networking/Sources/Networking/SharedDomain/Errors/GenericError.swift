//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct GenericError: LocalizedError {
    public let message: String
    public init(message: String) {
        self.message = message
    }
    
    public var errorDescription: String? {
        message
    }
}
