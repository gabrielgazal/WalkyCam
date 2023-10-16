import SwiftUI

protocol MenuAssemblerProtocol {
    func resolveView(
        route: MenuRoute
    ) -> MenuView<MenuViewModel, MenuRouter>
}