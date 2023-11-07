//
//  WCTopBarContainerView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

struct WCTopBarContainerView: View {
    // MARK: - Dependencies

    @Binding var selection: WCTopBarItem
    private var topBarItems: [WCTopBarItem]

    // MARK: - Initialization

    init(
        topBarItems: [WCTopBarItem],
        selection: Binding<WCTopBarItem>
    ) {
        self._selection = selection
        self.topBarItems = topBarItems
    }

    // MARK: - View Body

    var body: some View {
        VStack(spacing: 0) {
            WCTopBarView(
                tabs: topBarItems,
                selection: $selection
            )
            Spacer()
            ZStack {
                ForEach(topBarItems, id: \.title) { tab in
                    tab.destination
                        .opacity(selection == tab ? 1.0 : 0.0)
                }
            }
        }
    }
}
