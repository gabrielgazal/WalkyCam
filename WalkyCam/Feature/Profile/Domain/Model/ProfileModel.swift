import Foundation

struct UserData: Hashable {
    var profileImage: String
    var name: String
    var lastName: String
    var birthDate: String
    var isWalkCamer: Bool

    public init(
        profileImage: String = "",
        name: String = "",
        lastName: String = "",
        birthDate: String = "",
        isWalkCamer: Bool = false
    ) {
        self.profileImage = profileImage
        self.name = name
        self.lastName = lastName
        self.birthDate = birthDate
        self.isWalkCamer = isWalkCamer
    }
}
