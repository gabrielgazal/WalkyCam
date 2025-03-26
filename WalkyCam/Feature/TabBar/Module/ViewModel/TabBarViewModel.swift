import SwiftUI

final class TabBarViewModel: TabBarViewModelProtocol {

    // MARK: - Dependencies

    var interactor: TabBarInteractorProtocol

    @Published var tabSelection: WCTabBarItem {
        willSet {
            initSelectedTabBarItem(newValue)
        }
    }
    private var allTabBarItems: [WCTabBarItem]
    private let streetcammerManager = StreetcammerManager.shared
    @Published var tabBarItems: [WCTabBarItem]

    // MARK: - Initialization

    init(
        interactor: TabBarInteractorProtocol,
        tabSelection: WCTabBarItem,
        tabBarItems: [WCTabBarItem]
    ) {
        self.interactor = interactor
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
    
    // MARK: - Public API
    
//    @MainActor func fetchStreetcammers() async {
//        guard streetcammerManager.streetCammers.isEmpty else { return }
//        do {
//            let cammers = try await interactor.fetchStreetcammers()
//            streetcammerManager.saveStreetCammers(cammers)
//        } catch {}
//    }
}
