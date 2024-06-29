import SwiftUI

protocol UnavailableFeatureAssemblerProtocol {
    func resolveView(
        route: UnavailableFeatureRoute
    ) -> UnavailableFeatureView<UnavailableFeatureViewModel, UnavailableFeatureRouter>
}