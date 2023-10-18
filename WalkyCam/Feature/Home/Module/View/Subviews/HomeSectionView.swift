//
//  HomeSectionView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 17/10/23.
//

import Foundation
import SwiftUI

struct HomeSectionView<Content: View>: View {

    private let title: String
    private let icon: String
    private let content: Content

    public init(title: String,
                icon: String,
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.negro)
                    .frame(width: Tokens.Size.Font.large, height: Tokens.Size.Font.large)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                    .foregroundColor(.negro)
                Spacer()
            }
            content
        }
    }
}
