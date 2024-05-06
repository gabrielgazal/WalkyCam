import SwiftUI

protocol FeatureInformationAssemblerProtocol {
    func resolveView(
        route: FeatureInformationRoute
    ) -> FeatureInformationView<FeatureInformationViewModel, FeatureInformationRouter>
}