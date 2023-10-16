//
//  TabBarBuilder.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

protocol TabBarBuilderProtocol {
    func build() -> [WCTabBarItem]
}

final class TabBarBuilder: TabBarBuilderProtocol {
    // MARK: - Initializer

    public init() {}

    // MARK: - Public API

    func build() -> [WCTabBarItem] {
        var items: [WCTabBarItem] = []

        let tabBarHome = buildTabBarItemHome()
        let tabBarFunctions = buildTabBarItemFunctions()
        let tabBarMenu = buildTabBarItemMenu()

        items.append(tabBarHome)
        items.append(tabBarFunctions)
        items.append(tabBarMenu)

        return items
    }

    private func buildTabBarItemHome() -> WCTabBarItem {
        return WCTabBarItem(
            iconName: Asset.TabBar.home.name,
            title: "Home",
            destination: Color.blue.eraseToAnyView()
        )
    }

    private func buildTabBarItemFunctions() -> WCTabBarItem {
        return WCTabBarItem(
            iconName: Asset.TabBar.grid.name,
            title: "Funciones",
            destination: Color.red.eraseToAnyView()
        )
    }

    private func buildTabBarItemMenu() -> WCTabBarItem {
        return WCTabBarItem(
            iconName: Asset.TabBar.menu.name,
            title: "Menú",
            destination: Color.yellow.eraseToAnyView()
        )
    }
}
