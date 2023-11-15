import SwiftUI

protocol WalkyBotAssemblerProtocol {
    func resolveView(
        route: WalkyBotRoute
    ) -> WalkyBotView<WalkyBotViewModel, WalkyBotRouter>
}