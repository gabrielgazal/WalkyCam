//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

public struct UserResponse: Codable, Hashable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let address: String
    public let phone: String
    public let birthDate: String
    public let gender: String
    public let additionalInfo: String?
    public let isWalkCammer: Bool
    public let profileImage: String?
    public let configurations: ConfigurationsResponse

    public let type: String
    public let locationLatitude: String
    public let locationLongitude: String
    public let isLocationEnabled: String
    public let paymentMethod: String
    public let isVerified: Bool
    public let status: Int
    public let updatedAt: String
    public let createdAt: String
    public let isFakeUser: String

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName = "user_name"
        case lastName = "last_name"
        case phone = "cellphone_number"
        case birthDate = "birth_date"
        case additionalInfo = "about_me"
        case isWalkCammer = "is_walkcamer"
        case profileImage = "url_profile_picture"
        case configurations
        case name, email, address, gender
        case type
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
        case isLocationEnabled = "is_location_enabled"
        case paymentMethod = "payment_method"
        case isVerified = "is_verified"
        case status
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case isFakeUser = "is_fake_user"
    }
}
