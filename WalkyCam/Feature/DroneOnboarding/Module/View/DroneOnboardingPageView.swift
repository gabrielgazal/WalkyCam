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
    private var secondDescription: String?

    public init(
        illustration: Image,
        title: String,
        description: String,
        secondDescription: String? = nil
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
                .frame(width: 280)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
            HStack {
                if secondDescription != nil {
                    VStack {
                        Image(Asset.Icons.danger.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                }
                VStack {
                    Text(description.toMarkdown())
                        .font(.projectFont(size: Tokens.Size.Font.medium,
                                           weight: .medium))
                        .foregroundColor(.negro)
                        .lineLimit(nil)
                    Spacer()
                }
            }
            if let secondDescription = secondDescription {
                HStack {
                    VStack {
                        Image(Asset.Icons.danger.name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    VStack {
                        Text(secondDescription.toMarkdown())
                            .font(.projectFont(size: Tokens.Size.Font.medium,
                                               weight: .medium))
                            .foregroundColor(.negro)
                            .lineLimit(nil)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct DroneOnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        DroneOnboardingPageView(
            illustration: Asset.Illustrations.camerOnboarding.swiftUIImage,
            title: L10n.OnboardingView.Page1.title,
            description: L10n.WalkyCamerOnboardingView.Page2.subtitle1,
            secondDescription: L10n.WalkyCamerOnboardingView.Page2.subtitle2
        )
    }
}
