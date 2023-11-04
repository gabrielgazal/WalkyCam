import SwiftUI

final class MenuViewModel: MenuViewModelProtocol {
    // MARK: - Dependencies

    @Published var menuItems: [MenuItemModel] = []

    // MARK: - Initialization

    init() {
        buildMenuItems()
    }

    // MARK: - Private Methods

    private func buildMenuItems() {
        menuItems = [
            .init(icon: Asset.Menu.wallet.name, title: L10n.MenuViewModel.Item.wallet, routeToNavigate: CashWalletOnboardingRoute(isPresented: .constant(false))),
            .init(icon: Asset.Menu.galery.name, title: L10n.MenuViewModel.Item.galery, routeToNavigate: MockRoute()),
            .init(icon: Asset.Menu.settings.name, title: L10n.MenuViewModel.Item.settings, routeToNavigate: MockRoute()),
            .init(icon: Asset.Menu.help.name, title: L10n.MenuViewModel.Item.help, routeToNavigate: MockRoute()),
            .init(icon: Asset.Menu.bot.name, title: L10n.MenuViewModel.Item.bot, routeToNavigate: MockRoute())
        ]
    }
}

final class MockRoute: Route {
    func build() -> AnyView {
        return AnyView(Color.red)
    }

    var isPresented: Binding<Bool>

    init(isPresented: Binding<Bool> = .constant(false)) {
        self.isPresented = isPresented
    }
}
