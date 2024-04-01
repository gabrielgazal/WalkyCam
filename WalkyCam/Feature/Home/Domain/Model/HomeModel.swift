import SwiftUI

struct HomeModel {
    var profileInfo: ProfileData
    var recentFunctions: [RecentFunctionsData]
    var reminders: [RemindersData]
    var news: [NewsData]
    var favorites: [FavoritesData]
    var files: [FileData]

    public init(
        profileInfo: ProfileData = .init(),
        recentFunctions: [RecentFunctionsData] = [],
        reminders: [RemindersData] = [],
        news: [NewsData] = [],
        favorites: [FavoritesData] = [],
        files: [FileData] = []
    ) {
        self.profileInfo = profileInfo
        self.recentFunctions = recentFunctions
        self.reminders = reminders
        self.news = news
        self.favorites = favorites
        self.files = files
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

struct NewsData: Hashable {
    let id: Int
    let title: String
    let description: String
    let icon: String
}

struct FavoritesData: Hashable {
    let id: Int
    let name: String
    let imageUrl: String
    let stars: Int
    let location: String
    let technologies: [FavoritesTechnology]
}

struct FileData: Hashable {
    let id: Int
    let title: String
    let icon: String
}
