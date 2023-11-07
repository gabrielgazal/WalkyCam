//
//  WCTopBarView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

struct WCTopBarView: View {
    
    // MARK: - Dependencies

    let tabs: [WCTopBarItem]
    @Binding var selection: WCTopBarItem
    @Namespace private var namespace
    var body: some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .shadow(
            color: .black.opacity(0.2),
            radius: 8,
            x: 0,
            y: 2
        )
    }

    // MARK: - Private methods

    private func tabView(tab: WCTopBarItem) -> some View {
        HStack(spacing: Tokens.Size.Spacing.tiny) {
            Image(tab.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Text(tab.title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(fetchCurrentColor(tab))
        }
        .padding(.vertical, Tokens.Size.Spacing.small)
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(
            ZStack {
                Capsule()
                    .stroke(fetchStrokeColor(tab), lineWidth: 2)
                Capsule()
                    .fill(Color.blanco)
            }
        )
    }

    private func switchToTab(tab: WCTopBarItem) {
        selection = tab
    }

    private func fetchCurrentColor(_ tab: WCTopBarItem) -> Color {
        return (selection == tab ? Color.negro : Color.grisOscuro)
    }

    private func fetchStrokeColor(_ tab: WCTopBarItem) -> Color {
        return (selection == tab ? Color.naranja : Color.clear)
    }
}

struct IMCTopBarView_Previews: PreviewProvider {
    static let tabs: [WCTopBarItem] = [
        .init(iconName: Asset.Icons.cash.name,
              title: "Cash",
              destination: nil),
        .init(iconName: Asset.Icons.cryptocurrency.name,
              title: "Crypto",
              destination: nil),
        .init(iconName: Asset.Icons.shop.name,
              title: "Shop",
              destination: nil)
    ]

    static var previews: some View {
        VStack {
            WCTopBarView(tabs: tabs, selection: .constant(tabs.first!))
                .padding()
            Spacer()
        }
    }
}
