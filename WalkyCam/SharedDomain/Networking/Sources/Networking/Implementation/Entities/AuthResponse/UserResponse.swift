//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation

public struct UserResponse: Codable, Hashable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let address: String?          // Changed to optional (empty string in JSON)
    public let phone: String?            // Changed to optional (empty string in JSON)
    public let birthDate: String?        // Changed to optional (empty string in JSON)
    public let gender: String?           // Changed to optional (empty string in JSON)
    public let additionalInfo: String?
    public let isWalkCammer: Bool
    public let profileImage: String?     // Already optional - correct!
    public let configurations: ConfigurationsResponse

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName = "user_name"
        case lastName = "last_name"
        case phone = "cellphone_number"
        case birthDate = "birth_date"
        case additionalInfo = "about_me"
        case isWalkCammer = "is_walkcamer"
        case profileImage = "url_profile_picture"
        case name, email, address, configurations, gender
    }
}
