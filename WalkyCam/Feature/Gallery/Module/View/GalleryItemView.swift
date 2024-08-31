//
//  GalleryItemView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 24/10/23.
//

import Foundation
import SwiftUI

struct GalleryItemView: View {
    private let image: String

    public init(
        image: String
    ) {
        self.image = image
    }

    var body: some View {
        GeometryReader { geometry in
            Group {
                if let url = URL(string: image) {
                    AsyncImageView(imageLoadable: url) { status in
                        Group {
                            switch status {
                            case .failured:
                                placeholder
                            case .loading:
                                ProgressView()
                            default:
                                placeholder
                            }
                        }
                    }
                } else {
                    placeholder
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.width) // Usando largura para manter a view quadrada
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

struct GalleryItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GalleryItemView(image: "")
            GalleryItemView(image: "")
        }
    }
}
