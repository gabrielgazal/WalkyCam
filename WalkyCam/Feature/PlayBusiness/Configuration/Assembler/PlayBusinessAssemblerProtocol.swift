import SwiftUI

protocol PlayBusinessAssemblerProtocol {
    func resolveView(
        route: PlayBusinessRoute
    ) -> PlayBusinessView<PlayBusinessViewModel, PlayBusinessRouter>
}