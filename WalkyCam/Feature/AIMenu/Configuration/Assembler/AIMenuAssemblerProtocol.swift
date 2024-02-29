import SwiftUI

protocol AIMenuAssemblerProtocol {
    func resolveView(
        route: AIMenuRoute
    ) -> AIMenuView<AIMenuViewModel, AIMenuRouter>
}