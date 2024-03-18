import SwiftUI

protocol UnreleasedFeatureAssemblerProtocol {
    func resolveView(
        route: UnreleasedFeatureRoute
    ) -> UnreleasedFeatureView<UnreleasedFeatureViewModel, UnreleasedFeatureRouter>
}