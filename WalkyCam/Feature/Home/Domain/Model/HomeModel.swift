import SwiftUI

struct HomeModel {
    var profileInfo: ProfileData
    var searchText: String

    public init(
        profileInfo: ProfileData = .init(),
        searchText: String = ""
    ) {
        self.profileInfo = profileInfo
        self.searchText = searchText
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
