import SwiftUI

protocol FeatureSelectionAssemblerProtocol {
    func resolveView(
        route: FeatureSelectionRoute
    ) -> FeatureSelectionView<FeatureSelectionViewModel, FeatureSelectionRouter>
}