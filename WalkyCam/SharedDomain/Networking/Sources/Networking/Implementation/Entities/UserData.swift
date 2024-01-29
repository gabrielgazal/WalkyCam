//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct UserData: Codable, Hashable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let address: String

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName = "user_name"
        case lastName = "last_name"
        case name, email, address
    }
}
