import SwiftUI

protocol DroneConnectionAssemblerProtocol {
    func resolveView(
        route: DroneConnectionRoute
    ) -> DroneConnectionView<DroneConnectionViewModel, DroneConnectionRouter>
}