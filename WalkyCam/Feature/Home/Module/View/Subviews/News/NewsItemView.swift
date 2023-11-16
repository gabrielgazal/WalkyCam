//
//  NewsItemView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/11/23.
//

import Foundation
import SwiftUI

struct NewsItemView: View {
    private let title: String
    private let description: String
    private let icon: String

    public init(title: String,
                description: String,
                icon: String) {
        self.title = title
        self.description = description
        self.icon = icon
    }

    var body: some View {
        VStack(alignment: .center,
               spacing: 8) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Asset.Icons.robotW.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55)
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55)
            }
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
            Text(description)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .lineLimit(nil)
            WCUIButton(title: "Ver más",
                       style: .outline,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {})
        }
               .padding(Tokens.Size.Spacing.large)
               .background(
                Rectangle()
                    .fill(Color.blanco)
                    .cornerRadius(Tokens.Size.Border.Radius.large, corners: .allCorners)
               )
               .shadow(
                color: Color.negro.opacity(0.1),
                radius: 10,
                x: 0,
                y: 2
               )
               .frame(maxWidth: 310)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NewsItemView(title: "Falló tu conexión con SAP",
                         description: "Tienes las credenciales caducadas.",
                         icon: Asset.Icons.robotica.name)
        }
    }
}
