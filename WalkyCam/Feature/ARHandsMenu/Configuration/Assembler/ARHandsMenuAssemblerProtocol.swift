import SwiftUI

protocol ARHandsMenuAssemblerProtocol {
    func resolveView(
        route: ARHandsMenuRoute
    ) -> ARHandsMenuView<ARHandsMenuViewModel, ARHandsMenuRouter>
}