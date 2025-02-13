//
//  DroneOnboardingPageView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 17/12/23.
//

import Foundation
import SwiftUI

struct DroneOnboardingPageView: View {

    private var illustration: Image
    private var title: String
    private var description: String
    private var secondDescription: [String]?

    public init(
        illustration: Image,
        title: String,
        description: String,
        secondDescription: [String]? = nil
    ) {
        self.illustration = illustration
        self.title = title
        self.description = description
        self.secondDescription = secondDescription
    }

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {

            illustration
                .resizable()
                .scaledToFit()
                .frame(width: 300)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
            VStack(alignment: .leading) {
                HStack {
                    if secondDescription != nil {
                        VStack {
                            Image(Asset.Icons.danger.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    }
                    VStack {
                        Text(description.toMarkdown())
                            .font(.projectFont(size: Tokens.Size.Font.medium,
                                               weight: .medium))
                            .foregroundColor(.negro)
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                if let secondDescription = secondDescription {
                    ForEach(secondDescription, id: \.self) { item in
                        HStack {
                            VStack {
                                Image(Asset.Icons.danger.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                Spacer()
                            }
                            VStack {
                                Text(item.toMarkdown())
                                    .font(.projectFont(size: Tokens.Size.Font.medium,
                                                       weight: .medium))
                                    .foregroundColor(.negro)
                                    .lineLimit(2)
                                Spacer()
                            }
                        }
                    }
                }
                Spacer()
            }
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct DroneOnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        DroneOnboardingPageView(
            illustration: Asset.Icons.drone.swiftUIImage,
            title: "Consideraciones básicas",
            description: "No se permite volar a mas de 110 m de altura",
            secondDescription: [
                "Mantendremos la distancia legalmente regulada con áreas pobladas",
                "No está permitido el vuelvo en áreas restringidas.",
                "Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica."
            ]
        )
    }
}
