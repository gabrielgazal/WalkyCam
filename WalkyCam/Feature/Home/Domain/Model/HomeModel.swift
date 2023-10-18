import SwiftUI

struct HomeModel {
    var profileInfo: ProfileData
    var recentFunctions: [RecentFunctionsData]
    var reminders: [RemindersData]

    public init(
        profileInfo: ProfileData = .init(),
        recentFunctions: [RecentFunctionsData] = [],
        reminders: [RemindersData] = []
    ) {
        self.profileInfo = profileInfo
        self.recentFunctions = recentFunctions
        self.reminders = reminders
    }
}

struct ProfileData {
    var name: String
    var imageURL: String

    public init(name: String = "",
                imageURL: String = "") {
        self.name = name
        self.imageURL = imageURL
    }
}

struct RecentFunctionsData: Hashable {
    let id: Int
    let title: String
    let icon: String
}

struct RemindersData: Hashable {
    let id: Int
    let date: String
    let camerName: String
}
