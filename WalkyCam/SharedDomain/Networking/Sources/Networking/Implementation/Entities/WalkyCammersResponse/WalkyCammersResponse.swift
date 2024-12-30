import Foundation

public struct WalkyCammersResponse: Codable, Hashable {
    public let id: String
    public let userName: String
    public let name: String
    public let lastName: String
    public let email: String
    public let type: String
    public let cellphoneNumber: String
    public let gender: String
    public let address: String
    public let birthDate: String
    public let aboutMe: String
    public let locationLatitude: String
    public let locationLongitude: String
    public let paymentMethod: String
    public let urlProfilePicture: String
    public let isVerified: Bool
    public let isWalkcamer: Bool
    public let status: Int
    public let configurations: ConfigurationsResponse
    public let updatedAt: String
    public let createdAt: String
    public let walkycamerInfo: WalkycammerInfo
    
    private enum CodingKeys: String, CodingKey {
        case name, email, type, gender, address, status, configurations
        case id = "_id"
        case userName = "user_name"
        case lastName = "last_name"
        case cellphoneNumber = "cellphone_number"
        case birthDate = "birth_date"
        case aboutMe = "about_me"
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
        case paymentMethod = "payment_method"
        case urlProfilePicture = "url_profile_picture"
        case isVerified = "is_verified"
        case isWalkcamer = "is_walkcamer"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case walkycamerInfo = "walkcamer_info"
    }
}

public struct WalkycammerInfo: Codable, Hashable {
    public let rovsInfo: [DeviceInfo]?
    public let smartphonesInfo: [DeviceInfo]?
    public let days: [DayInfo]
    public let preferredLocation: PreferredLocation
    public let earningType: String
    public let availability: Bool
    public let diveInfo: DiveInfo?
    public let driveInfo: DriveInfo?
    
    private enum CodingKeys: String, CodingKey {
        case rovsInfo = "rovs_info"
        case smartphonesInfo = "smartphones_info"
        case days
        case preferredLocation = "preferred_location"
        case earningType = "earning_type"
        case availability
        case diveInfo = "dive_info"
        case driveInfo = "drive_info"
    }
}

public struct DeviceInfo: Codable, Hashable {
    public let brand: String
    public let model: String
    public let serialNumber: String
    
    private enum CodingKeys: String, CodingKey {
        case brand, model
        case serialNumber = "serial_number"
    }
}

public struct DayInfo: Codable, Hashable {
    public let day: String
    public let primaryStartTime: String
    public let primaryEndTime: String
    public let secondaryStartTime: String
    public let secondaryEndTime: String
    
    private enum CodingKeys: String, CodingKey {
        case day
        case primaryStartTime = "primary_start_time"
        case primaryEndTime = "primary_end_time"
        case secondaryStartTime = "secondary_start_time"
        case secondaryEndTime = "secondary_end_time"
    }
}

public struct DiveInfo: Codable, Hashable {
    public let maxMetersDepth: String
    
    private enum CodingKeys: String, CodingKey {
        case maxMetersDepth = "max_meters_depth"
    }
}

public struct DriveInfo: Codable, Hashable {
    public let vehicleType: String
    
    private enum CodingKeys: String, CodingKey {
        case vehicleType = "vehicle_type"
    }
}

public struct PreferredLocation: Codable, Hashable {
    public let type: String
    public let coordinates: [Double]
    
    private enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}
