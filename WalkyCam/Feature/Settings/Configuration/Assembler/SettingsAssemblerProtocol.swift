import SwiftUI

protocol SettingsAssemblerProtocol {
    func resolveView(
        route: SettingsRoute
    ) -> SettingsView<SettingsViewModel, SettingsRouter>
}