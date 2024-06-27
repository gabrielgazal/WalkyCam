import SwiftUI

protocol GamesAssemblerProtocol {
    func resolveView(
        route: GamesRoute
    ) -> GamesView<GamesViewModel, GamesRouter>
}