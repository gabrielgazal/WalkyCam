//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct ResponseError: Codable, LocalizedError {
    public var status: Int? = 0
    public var code: String?
    public var error: String = ""
    
    public init(
        status: Int,
        code: String?,
        error: String
    ) {
        self.status = status
        self.code = code
        self.error = error
    }
    
    public var errorDescription: String? {
        error
    }
}
