import Foundation

struct UserData: Hashable {
    var profileImage: String
    var name: String
    var lastName: String
    var phoneNumber: String
    var birthDate: String
    var gender: String
    var address: String
    var additionalInfo: String
    var email: String
    var userName: String
    var isWalkCamer: Bool
    var planName: String
    
    public init(
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
