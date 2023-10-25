import SwiftUI

protocol ProfileAssemblerProtocol {
    func resolveView(
        route: ProfileRoute
    ) -> ProfileView<ProfileViewModel, ProfileRouter>
}