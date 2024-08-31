import SwiftUI

final class MenuViewModel: MenuViewModelProtocol {
    // MARK: - Dependencies

    @Published var menuItems: [MenuItemModel] = []
    @State private var isCashWalletOnboardingDisabled = UserDefaults.standard.bool(forKey: "isCashWalletOnboardingDisabled")
    private let router: MenuRouterProtocol

    // MARK: - Initialization

    init(router: MenuRouterProtocol) {
        self.router = router
        buildMenuItems()
    }

    // MARK: - Private Methods

    private func buildMenuItems() {
        menuItems = [
            .init(icon: Asset.Menu.wallet.name,
                  title: L10n.MenuViewModel.Item.wallet,
                  routeToNavigate: fetchCashWalletRoute()),
            .init(icon: Asset.Menu.galery.name,
                  title: L10n.MenuViewModel.Item.galery,
                  routeToNavigate: GalleryRoute(isPresented: .constant(false))),
            .init(icon: Asset.Menu.settings.name,
                  title: L10n.MenuViewModel.Item.settings,
                  routeToNavigate: nil),
            .init(icon: Asset.Menu.help.name,
                  title: L10n.MenuViewModel.Item.help,
                  routeToNavigate: nil),
            .init(icon: Asset.Menu.usdBlack.name,
                  title: "Planes y Precios",
                  routeToNavigate: RegistrationPlansRoute(isPresented: .constant(false))),
            .init(icon: Asset.Menu.bot.name,
                  title: L10n.MenuViewModel.Item.bot,
                  routeToNavigate: WalkyBotRoute(isPresented: .constant(false)))
        ]
    }
    
    func assembleMenuBannnerData() -> [MenuPlanBannerModel] {
        return [
            .init(title: "Basic", text: "Consigue mas beneficios!", color: .acentoFondoDark, action: navigateToBasic),
            .init(title: "Standard", text: "Consigue mas beneficios. Vuela un Drone a distancia!", color: .naranja, action: navigateToStandard),
            .init(title: "Premium", text: "Consigue TODOS los beneficios que WalkyCam ofrece ", color: .premium, action: navigateToPremium)
        ]
    }

    private func fetchCashWalletRoute() -> Route {
        return isCashWalletOnboardingDisabled ? CashWalletRoute(isPresented: .constant(false)): CashWalletOnboardingRoute(isPresented: .constant(false))
    }
    
    private func navigateToBasic() {
        router.routeToBasic()
    }
    
    private func navigateToStandard() {
        router.routeToStandard()
    }
    
    private func navigateToPremium() {
        router.routeToPremium()
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
