import Foundation

struct UserData: Hashable {
    public var id: String
    public var profileImage: String
    public var name: String
    public var lastName: String
    public var phoneNumber: String
    public var birthDate: String
    public var gender: String
    public var address: String
    public var additionalInfo: String
    public var email: String
    public var userName: String
    public var isWalkCamer: Bool
    public var planName: String
    
    public init(
        id: String = "",
        profileImage: String = "",
        name: String = "",
        lastName: String = "",
        phoneNumber: String = "",
        birthDate: String = "",
        gender: String = "",
        address: String = "",
        additionalInfo: String = "",
        email: String = "",
        userName: String = "",
        isWalkCamer: Bool = false,
        planName: String = ""
    ) {
        self.id = id
        self.profileImage = profileImage
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.birthDate = birthDate
        self.gender = gender
        self.address = address
        self.additionalInfo = additionalInfo
        self.email = email
        self.userName = userName
        self.isWalkCamer = isWalkCamer
        self.planName = planName
    }
}
