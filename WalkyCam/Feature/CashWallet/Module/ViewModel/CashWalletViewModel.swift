import SwiftUI

final class CashWalletViewModel: CashWalletViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CashWalletInteractorProtocol
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var tabBarItems: [WCTopBarItem] = []

    // MARK: - Initialization

    init(interactor: CashWalletInteractorProtocol = CashWalletInteractor()) {
        self.interactor = interactor
        initializeTabs()
    }

    // MARK: - Private Methods

    private func initializeTabs() {
        let tabs: [WCTopBarItem] = [
            .init(iconName: Asset.Icons.cash.name,
                  title: "Cash",
                  destination: CashTabRoute(isPresented: .constant(false)).build()),
            .init(iconName: Asset.Icons.cryptocurrency.name,
                  title: "Crypto",
                  destination: nil),
            .init(iconName: Asset.Icons.shop.name,
                  title: "Shop",
                  destination: nil)
        ]
        tabBarItems = tabs
        tabSelection = tabs[0]
    }
}
