//
//  WCTabBarView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

struct WCTabBarView: View {
    // MARK: - Dependencies

    let tabs: [WCTabBarItem]
    @Binding var selection: WCTabBarItem
    @Namespace private var namespace

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .background(
            Color.blanco
                .cornerRadius(48, corners: [.topLeft, .topRight])
                .ignoresSafeArea(edges: .bottom)
        )
        .shadow(
            color: .black.opacity(0.2),
            radius: 8,
            x: 0,
            y: 2
        )
    }

    // MARK: - Private methods

    private func tabView(tab: WCTabBarItem) -> some View {
        VStack(spacing: Tokens.Size.Spacing.tiny) {
            Image(tab.iconName)
                .renderingMode(.template)
                .foregroundColor(fetchCurrentColor(tab))
                .isHidden(tab.iconName == Asset.TabBar.grid.name)
            Image(tab.iconName)
                .isHidden(tab.iconName != Asset.TabBar.grid.name)
            Text(tab.title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
        }
        .foregroundColor(fetchCurrentColor(tab))
        .padding([.top], Tokens.Size.Spacing.regular)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .cornerRadius(48, corners: [.topLeft, .topRight])
    }

    private func switchToTab(tab: WCTabBarItem) {
        selection = tab
    }

    private func fetchCurrentColor(_ tab: WCTabBarItem) -> Color {
        return (selection == tab ? Color.naranja : Color.negro)
    }
}

struct IMCTabBarView_Previews: PreviewProvider {
    static let tabs: [WCTabBarItem] = [
        WCTabBarItem(
            iconName: Asset.TabBar.home.name,
            title: "Home",
            destination: Color.red.eraseToAnyView()
        ),
        WCTabBarItem(
            iconName: Asset.TabBar.home.name,
            title: "Imóveis",
            destination: Color.blue.eraseToAnyView()
        ),
        WCTabBarItem(
            iconName: Asset.TabBar.home.name,
            title: "Clientes",
            destination: Color.yellow.eraseToAnyView()
        ),
        WCTabBarItem(
            iconName: Asset.TabBar.home.name,
            title: "Conta",
            destination: Color.green.eraseToAnyView()
        )
    ]

    static var previews: some View {
        VStack {
            Spacer()
            WCTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
        .background(Color.blancoGris)
    }
}
