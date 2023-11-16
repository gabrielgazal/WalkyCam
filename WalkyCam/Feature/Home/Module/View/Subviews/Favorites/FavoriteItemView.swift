//
//  FavoriteItemView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/11/23.
//

import Foundation
import SwiftUI

struct FavoriteItemView: View {
    private let name: String
    private let photo: String
    private let location: String
    private let stars: Int
    private let technologies: [FavoritesTechnology]

    public init(
        name: String,
        photo: String,
        location: String,
        stars: Int,
        technologies: [FavoritesTechnology]
    ) {
        self.name = name
        self.photo = photo
        self.location = location
        self.stars = stars
        self.technologies = technologies
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center,
                   spacing: 8) {
                ZStack {
                    Rectangle()
                        .fill(Color.gris)
                    if let url = URL(string: photo) {
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
                    .frame(height: 130)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(name)
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                    starsView
                    HStack(spacing: Tokens.Size.Spacing.tiny) {
                        Image(Asset.Icons.location.name)
                            .resizable()
                            .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                            .foregroundColor(.naranja)
                        Text(location)
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                    }
                    functionsView
                }
                       .padding(Tokens.Size.Spacing.large)
            }
            VStack {
                HStack {
                    Spacer()
                    Image(Asset.Icons.heart.name)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: Tokens.Size.Spacing.xlarge, height: Tokens.Size.Spacing.xlarge)
                        .foregroundColor(.naranja)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .background(
         Rectangle()
             .fill(Color.blanco)
        )
        .frame(maxWidth: 250, maxHeight: 310)
        .cornerRadius(Tokens.Size.Border.Radius.xlarge, corners: .allCorners)
        .shadow(
         color: Color.negro.opacity(0.1),
         radius: 10,
         x: 0,
         y: 2
    )
    }

    private var starsView: some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            ForEach(1..<6) { item in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: Tokens.Size.Spacing.regular, height: Tokens.Size.Spacing.regular)
                    .foregroundColor(item <= stars ? Color.naranja : Color.gris)
            }
        }
    }

    private var functionsView: some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            Image(Asset.Icons.drone.name)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(technologies.contains { $0 == FavoritesTechnology.drone } ? .naranja : .gris)
            Image(Asset.Icons.scan3D.name)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(technologies.contains { $0 == FavoritesTechnology.scan } ? .naranja : .gris)
            Image(systemName: "iphone.smartbatterycase.gen1")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(technologies.contains { $0 == FavoritesTechnology.smartphone } ? .naranja : .gris)
            Image(systemName: "camera")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(technologies.contains { $0 == FavoritesTechnology.camera } ? .naranja : .gris)
            Image(systemName: "video")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 30)
                .foregroundColor(technologies.contains { $0 == FavoritesTechnology.video } ? .naranja : .gris)
        }
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}

enum FavoritesTechnology: Int, CaseIterable {
    case drone = 0
    case scan
    case smartphone
    case camera
    case video
}

struct FavoriteItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FavoriteItemView(name: "teste",
                             photo: .imageMock,
                             location: "TEst",
                             stars: 3,
                             technologies: [.drone, .video])
        }
    }
}
