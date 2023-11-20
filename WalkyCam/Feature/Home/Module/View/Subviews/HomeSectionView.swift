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
    private let icon: String?
    private let action: (() -> Void)?
    private let content: Content

    public init(title: String,
                icon: String? = nil,
                action: (() -> Void)? = nil,
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.action = action
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                if let icon = icon {
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.negro)
                        .frame(width: Tokens.Size.Font.large, height: Tokens.Size.Font.large)
                }
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                    .foregroundColor(.negro)
                Spacer()
                if let action = action {
                    LinkButton(title: "Ver más",
                               color: .naranja,
                               action: {
                        action()
                    })
                }
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
            content
        }
    }
}
