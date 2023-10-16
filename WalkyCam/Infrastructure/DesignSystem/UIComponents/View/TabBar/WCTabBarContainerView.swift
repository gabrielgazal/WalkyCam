//
//  WCTabBarContainerView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

struct WCTabBarContainerView: View {
    // MARK: - Dependencies

    @Binding var selection: WCTabBarItem
    private var tabBarItems: [WCTabBarItem]

    // MARK: - Initialization

    init(
        tabBarItems: [WCTabBarItem],
        selection: Binding<WCTabBarItem>
    ) {
        self._selection = selection
        self.tabBarItems = tabBarItems
    }

    // MARK: - View Body

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ForEach(tabBarItems, id: \.title) { tab in
                    tab.destination
                        .opacity(selection == tab ? 1.0 : 0.0)
                }
            }
            Spacer()
            WCTabBarView(
                tabs: tabBarItems,
                selection: $selection
            )
        }
    }
}
