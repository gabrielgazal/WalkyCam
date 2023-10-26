//
//  RepositoryError.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import Foundation

public struct RepositoryError: Error, Equatable {
    public let status : Status
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
