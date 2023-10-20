//
//  OnboardingPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import Foundation
import SwiftUI

struct OnboardingPageView: View {

    private var illustration: Image
    private var title: String
    private var description: String

    public init(
        illustration: Image,
        title: String,
        description: String
    ) {
        self.illustration = illustration
        self.title = title
        self.description = description
    }

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.small) {
            Image(uiImage: Asset.logo.image)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.naranja)
                .scaledToFit()
                .frame(width: 210)
            illustration
                .resizable()
                .frame(width: 280,
                       height: 280)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
            Text(description.toMarkdown())
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.medium,
                                   weight: .medium))
                .foregroundColor(.negro)
                .lineLimit(nil)
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            illustration: Asset.Illustrations.onboarding1.swiftUIImage,
            title: L10n.OnboardingView.Page1.title,
            description: L10n.OnboardingView.Page1.subtitle
        )
    }
}
