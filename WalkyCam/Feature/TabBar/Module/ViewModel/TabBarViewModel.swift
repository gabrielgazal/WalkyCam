import SwiftUI

final class TabBarViewModel: TabBarViewModelProtocol {

    // MARK: - Dependencies

    @Published var tabSelection: WCTabBarItem {
        willSet {
            initSelectedTabBarItem(newValue)
        }
    }
    private var allTabBarItems: [WCTabBarItem]
    @Published var tabBarItems: [WCTabBarItem]

    // MARK: - Initialization

    init(
        tabSelection: WCTabBarItem,
        tabBarItems: [WCTabBarItem]
    ) {
        self.tabSelection = tabSelection
        self.allTabBarItems = tabBarItems
        self.tabBarItems = tabBarItems.map {
            WCTabBarItem(
                iconName: $0.iconName,
                title: $0.title
            )
        }
        initSelectedTabBarItem(tabSelection)
    }

    // MARK: - Private Methods

    private func initSelectedTabBarItem(_ selected: WCTabBarItem) {
        guard
            let tabBarItem = allTabBarItems.first(where: { $0 == selected }),
            let tabBarItemIndex = tabBarItems.firstIndex(of: tabBarItem)
        else { return }
        tabBarItems[tabBarItemIndex].destination = tabBarItem.destination
    }
}
