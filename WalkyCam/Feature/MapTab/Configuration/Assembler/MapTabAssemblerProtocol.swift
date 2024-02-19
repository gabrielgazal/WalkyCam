import SwiftUI

protocol MapTabAssemblerProtocol {
    func resolveView(
        route: MapTabRoute
    ) -> MapTabView<MapTabViewModel, MapTabRouter>
}