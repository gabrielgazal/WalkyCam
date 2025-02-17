//
//  GalleryModelVisualizer.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/02/25.
//

import Foundation
import SwiftUI

struct GalleryModelVisualizer: View {
    private let path: String

    public init(
        path: String
    ) {
        self.path = path
    }

    var body: some View {
        GeometryReader { geometry in
            Group {
                if let url = URL(string: path) {
                    WebView(
                        url: url,
                        actions: .init()
                    )
                } else {
                    placeholder
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.width)
            .clipped()
            .cornerRadius(Tokens.Size.Border.Radius.medium, corners: .allCorners)
            .background(
                Color.blanco
                    .cornerRadius(Tokens.Size.Border.Radius.medium)
                    .shadow(
                        color: .black.opacity(0.1),
                        radius: 8,
                        x: 0,
                        y: 2
                    )
            )
        }
        .aspectRatio(1, contentMode: .fit) // Garantir que a view seja quadrada
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }

}
