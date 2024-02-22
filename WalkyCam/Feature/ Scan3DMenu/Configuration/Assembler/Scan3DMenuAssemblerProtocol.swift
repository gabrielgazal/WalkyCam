import SwiftUI

protocol Scan3DMenuAssemblerProtocol {
    func resolveView(
        route: Scan3DMenuRoute
    ) -> Scan3DMenuView<Scan3DMenuViewModel, Scan3DMenuRouter>
}