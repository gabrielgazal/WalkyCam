//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct RepositoryError: Error {
    public let status: Status
    public let message: String
    public init(
        status: Status,
        message: String
    ) {
        self.status = status
        self.message = message
    }
}

public extension RepositoryError {
    enum Status: Equatable {
        case unexpected
        case generic
        case code(Int)
        case domainCode(String)
        case unauthorized
    }
}

extension RepositoryError: LocalizedError {
    public var errorDescription: String? { message }
}
