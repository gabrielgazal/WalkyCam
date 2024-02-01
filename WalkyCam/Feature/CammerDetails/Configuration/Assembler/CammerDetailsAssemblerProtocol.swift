import SwiftUI

protocol CammerDetailsAssemblerProtocol {
    func resolveView(
        route: CammerDetailsRoute
    ) -> CammerDetailsView<CammerDetailsViewModel, CammerDetailsRouter>
}