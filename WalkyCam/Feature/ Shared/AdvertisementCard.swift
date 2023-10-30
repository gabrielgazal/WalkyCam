//
//  AdvertisementCard.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 30/10/23.
//

import Foundation
import SwiftUI

struct AdvertisementCardView: View {

    private let backgroundImage: String
    private let text: String
    private let action: (() -> Void)?

    public init(
        backgroundImage: String,
        text: String,
        action: (() -> Void)?
    ) {
        self.backgroundImage = backgroundImage
        self.text = text
        self.action = action
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Image(Asset.logo.name)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.naranja)
                        .frame(width: 105)
                    Image(systemName: "crown.fill")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.premium)
                        .frame(width: 24)
                }
                Text(text.toMarkdown())
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                    .foregroundColor(.blanco)
                WCUIButton(title: "Ser Premium",
                           style: .outline,
                           descriptor: YellowButtonStyleDescriptor(),
                           action: { action?() })
                .frame(width: 150)
            }
                   .padding(Tokens.Size.Spacing.regular)
                   .background(
                           Image(backgroundImage)
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .clipped()
                   )
        }
        .frame(width: .infinity, height: 250)
        .clipped()
        .contentShape(Rectangle())
    }
}

struct AdvertisementCardView_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementCardView(backgroundImage: Asset.Fondos.loginFondo.name,
                              text: "Con **Plan Premium** tendras: Drone Fly, Inspección con LIDAR, acceso a GeoRadar, servicios especializados legales y de ingeniería y mucho más.",
                              action: {})
    }
}
