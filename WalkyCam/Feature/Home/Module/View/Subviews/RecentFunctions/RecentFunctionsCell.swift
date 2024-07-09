//
//  RecentFunctionsCell.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/10/23.
//

import Foundation
import SwiftUI

struct RecentFunctionsCell: View {

    let title: String
    let icon: String
    let lastItem: Bool

    public init(
        title: String,
        icon: String,
        lastItem: Bool
    ) {
        self.title = title
        self.icon = icon
        self.lastItem = lastItem
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blanco)
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(Tokens.Size.Border.Radius.medium, corners: .allCorners)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 48)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(Tokens.Size.Spacing.small)
        .shadow(
            color: lastItem ? .clear : Color.negro.opacity(0.1),
            radius: 10,
            x: 0,
            y: 2
        )
    }
}

struct RecentFunctionsCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RecentFunctionsCell(title: "Teste", icon: Asset.Icons.ar.name, lastItem: false)
            RecentFunctionsCell(title: "Teste", icon: Asset.Icons.ar.name, lastItem: true)
        }
    }
}
