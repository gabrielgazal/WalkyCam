import SwiftUI

protocol StreetCamMenuAssemblerProtocol {
    func resolveView(
        route: StreetCamMenuRoute
    ) -> StreetCamMenuView<StreetCamMenuViewModel, StreetCamMenuRouter>
}