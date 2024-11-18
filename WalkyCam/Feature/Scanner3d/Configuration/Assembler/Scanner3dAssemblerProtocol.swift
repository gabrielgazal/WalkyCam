import SwiftUI

protocol Scanner3dAssemblerProtocol {
    func resolveView(
        route: Scanner3dRoute
    ) -> Scanner3dView<Scanner3dViewModel, Scanner3dRouter>
}