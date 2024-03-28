import SwiftUI

protocol RadarMenuAssemblerProtocol {
    func resolveView(
        route: RadarMenuRoute
    ) -> RadarMenuView<RadarMenuViewModel, RadarMenuRouter>
}