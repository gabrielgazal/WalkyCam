//
//  CheckboxToggle.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import SwiftUI

public struct CheckBoxToggle: View {

    // MARK: - Dependencies

    private var model: SelectorModel
    private var foregroundColor: Color

    // MARK: - Initialization

    public init(
        model: SelectorModel,
        foregroundColor: Color = Color.blanco
    ) {
        self.model = model
        self.foregroundColor = foregroundColor
    }

    // MARK: - UIView Body

    public var body: some View {
        HStack(
            alignment: .center,
            spacing: Tokens.Size.Spacing.small
        ) {
            ZStack {
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.small)
                    .fill(foregroundColor == .blanco ? Color.negro.opacity(0.25) : Color.blanco)
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.small)
                    .stroke(Color.naranja)
                Image(uiImage: Asset.Icons.check.image)
                    .resizable()
                    .foregroundColor(Color.negro)
                    .isHidden(!model.isSelected)
            }
            .frame(width: 24,
                   height: 24)
            Text(model.value)
                .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                .foregroundColor(foregroundColor)
            Spacer()
        }
        .padding(.vertical, Tokens.Size.Spacing.regular)
        .padding(.horizontal, Tokens.Size.Spacing.small)
    }
}
