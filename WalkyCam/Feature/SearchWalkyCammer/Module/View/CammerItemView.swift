//
//  CammerItemView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 01/02/24.
//

import Foundation
import SwiftUI

struct CammerItemView: View {
    private let name: String
    private let photo: String
    private let description: String
    private let stars: Int
    private let technologies: [CammerTechnology]

    public init(
        name: String,
        photo: String,
        description: String,
        stars: Int,
        technologies: [CammerTechnology]
    ) {
        self.name = name
        self.photo = photo
        self.description = description
        self.stars = stars
        self.technologies = technologies
    }

    var body: some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.small) {
            VStack {
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
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                starsView
                Text(name)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                Text(description.toMarkdown())
                    .font(.projectFont(size: Tokens.Size.Font.small))
                functionsView
            }
        }
               .padding(Tokens.Size.Spacing.large)
               .background( Color.blanco)
               .cornerRadius(Tokens.Size.Border.Radius.huge, corners: .allCorners)
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
                .foregroundColor(technologies.contains { $0 == CammerTechnology.drone } ? .naranja : .gris)
            Image(Asset.Icons.scan3D.name)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(technologies.contains { $0 == CammerTechnology.scan } ? .naranja : .gris)
            Image(systemName: "iphone.smartbatterycase.gen1")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(technologies.contains { $0 == CammerTechnology.smartphone } ? .naranja : .gris)
            Image(systemName: "camera")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(technologies.contains { $0 == CammerTechnology.camera } ? .naranja : .gris)
            Image(systemName: "video")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(technologies.contains { $0 == CammerTechnology.video } ? .naranja : .gris)
        }
        .frame(height: 24)
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}

struct CammerItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CammerItemView(name: "Camila Pérez",
                           photo: .imageMock,
                           description: "TEst",
                           stars: 3,
                           technologies: [.drone, .video])
        }
    }
}
