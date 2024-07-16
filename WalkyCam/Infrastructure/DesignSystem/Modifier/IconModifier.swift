//
//  IconModifier.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 16/07/24.
//

import SwiftUI

struct InfoIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            Image(systemName: "questionmark.circle")
                .foregroundColor(Color.naranja)
                .scaledToFit()
                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                .padding(Tokens.Size.Spacing.large)
        }
    }
}

extension View {
    func withInfoIcon() -> some View {
        self.modifier(InfoIconModifier())
    }
}
