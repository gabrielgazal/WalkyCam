//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 03/07/25.
//

import Foundation

public struct LoginResponse: Codable {
    public let success: Bool
    public let responseCode: Int
    public let responseMessage: String
    public let user: UserResponse
    public let token: String

    private enum CodingKeys: String, CodingKey {
        case success
        case responseCode = "response_code"
        case responseMessage = "response_message"
        case user
        case token
    }
}
