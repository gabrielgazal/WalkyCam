import Foundation

struct UserData: Hashable {
    var profileImage: String
    var name: String
    var lastName: String
    var birthDate: String
    var isWalkCamer: Bool
    var planName: String
    var phoneNumber: String

    public init(
        profileImage: String = "",
        name: String = "",
        lastName: String = "",
        birthDate: String = "",
        isWalkCamer: Bool = false,
        planName: String = "",
        phoneNumber: String = ""
    ) {
        self.profileImage = profileImage
        self.name = name
        self.lastName = lastName
        self.birthDate = birthDate
        self.isWalkCamer = isWalkCamer
        self.planName = planName
        self.phoneNumber = phoneNumber
    }
}
