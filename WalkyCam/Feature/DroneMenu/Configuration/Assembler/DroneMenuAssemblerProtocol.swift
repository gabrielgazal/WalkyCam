import SwiftUI

protocol DroneMenuAssemblerProtocol {
    func resolveView(
        route: DroneMenuRoute
    ) -> DroneMenuView<DroneMenuViewModel, DroneMenuRouter>
}