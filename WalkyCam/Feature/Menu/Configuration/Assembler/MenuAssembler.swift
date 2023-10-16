import SwiftUI

final class MenuAssembler: MenuAssemblerProtocol {
    func resolveView(
        route: MenuRoute
    ) -> MenuView<MenuViewModel, MenuRouter> {

        let router = MenuRouter(isPresented: route.isPresented)

        let viewModel = MenuViewModel()
        let view = MenuView(viewModel: viewModel, router: router)

        return view
    }
}
