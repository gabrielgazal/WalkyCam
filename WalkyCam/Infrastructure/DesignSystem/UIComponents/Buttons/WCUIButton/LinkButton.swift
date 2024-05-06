//
//  LinkButtoin.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

struct LinkButton: View {
    private let title: String
    private let icon: String?
    private let color: Color
    private let action: () -> Void
    @Environment(\.isEnabled) private var isEnabled: Bool

    init(
        title: String,
        icon: String? = nil,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(
            action: action,
            label: {
                HStack(spacing: 12) {
                    iconView
                    Text(title)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        .foregroundColor(foregroundColor)
                }
            })
        .linkButton()
    }

    private var foregroundColor: Color {
        return isEnabled ? color : .blancoGris
    }

    private var iconView: some View {
        if let icon = icon {
            return Image(icon)
                .renderingMode(.template)
                .foregroundColor(color)
                .eraseToAnyView()
        }
        return EmptyView()
                .eraseToAnyView()
    }
}
